require 'date'
require 'icalendar'

module Jekyll
  module Events

    # Helpers

    def date_or_datetime(d)
      # Input could be a String, Date, or DateTime
      # Want to return a Date or DateTime since they have mostly the same methods
      d.kind_of?(Date) ? d : d.to_datetime
    rescue
      nil
    end

    def ical_time(d)
      # Dates and DateTimes have different handling so can't use date_or_datetime
      if d.class == Date # no time
        Icalendar::Values::Date.new(d.strftime('%Y%m%d'))
      else # with time, String or DateTime object
        Icalendar::Values::DateTime.new(d.to_datetime.utc.strftime('%Y%m%dT%H%M%SZ'))
      end
    end

    # Filters

    def filter_old_events(events)
      events.reject { |event| date_or_datetime(event['start']).past? }
    end

    def filter_json_events(events)
      events.map do |event|
        # for calendar rendering, link within the page for current events
        event['url'] = "/events/##{Jekyll::Utils.slugify(event['title'])}" unless
          date_or_datetime(event['start']).past?
        event
      end.to_json
    end

    def fix_calendar_dates(events)
      events.map do |event|
        dstart = date_or_datetime(event['start'])
        dend   = date_or_datetime(event['end'])

        # Calendar assumes midnight is at the *start* of the day, so a date-only
        # range like 01-30 -> 01-31 would only render on the 30th.
        # So add a day for date-only events
        if (event['start'].class == Date) && !dend.nil?
          dend   = dend.next_day
        end

        # Calendar requires JSON like '2016-04-06T15:45:00+01:00' or '2016-04-06'
        event['start'] = dstart.to_s
        event['end']   = dend.to_s unless dend.nil?
        event
      end
    end

    def format_event_date start_date, end_date
      # Compares start_date with end_date to decide how to format the date correctly
      return "" unless start_date

      if start_date.class == Date
        # no times, just use dates
        if end_date.nil? || start_date == end_date
          # one-day event
          start_date.strftime('%-d %B, %Y')
        else
          "#{start_date.strftime('%-d %B, %Y')} - #{end_date.strftime('%-d %B, %Y')}"
        end
      else
        # times included, passed in as strings. more parsing to do
        dstart = date_or_datetime(start_date)
        dend   = date_or_datetime(end_date)

        if dend.nil? || dstart.to_date == dend.to_date
          # one-day event
          if (dend.nil? || dstart.strftime('%H:%M') == dend.strftime('%H:%M'))
            # single time
            dstart.strftime('%-d %B, %Y - %H:%M (%Z)')
          else
            "#{dstart.strftime('%-d %B, %Y')} - #{dstart.strftime('%H:%M')}-#{dend.strftime('%H:%M (%Z)')}"
          end
        else
          # multiday, times not so relevant (or no endtime set)
          "#{dstart.strftime('%-d %B, %Y')} - #{dend.strftime('%-d %B, %Y')}"
        end
      end

    end

    def generate_ics(events)
      cal = Icalendar::Calendar.new
      cal.x_wr_calname = 'Foreman Community Calendar'

      events.each do |event|
        cal_event = Icalendar::Event.new

        speaker_text     = event['speaker'].nil? ? '' : "Speaker: #{event['speaker']}\n\n"
        description_text = event['description'].strip

        cal_event.summary     = event['title'].gsub(/:/, '\\:')
        cal_event.location    = event['location']
        cal_event.description = (speaker_text + description_text).strip

        if event['start'] && event['end']
          cal_event.dtstart = ical_time(event['start'])
          cal_event.dtend   = ical_time(event['end'])
        elsif event['start'] && event['start'].class != Date
          # Has a time, assume 1hr duration
          cal_event.dtstart = ical_time(event['start'])
          cal_event.dtend   = ical_time(event['start'].to_datetime + 1.hours)
        end
        cal.add_event(cal_event)
      end
      cal.to_ical
    end

  end

end

Liquid::Template.register_filter(Jekyll::Events)

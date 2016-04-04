// Display the tooltip during mouseover
tooltipShow = function(event, jsEvent, view) {
  var $item, eventInfo, eventText, label, value;
  $item = $(this);

  // Collect the event info
  eventInfo = {
    Title:    event.title,
    Host:     event.speaker,
    Location: event.location,
    Time:     !event.allDay ? event.start.format('h:mm a z') : void 0,
    Topic:    event.tags ? event.tags.join() : void 0
  };

  // Format the event text for the tooltip
  eventText = (function() {
    var results;
    results = [];
    for (label in eventInfo) {
      value = eventInfo[label];
      if (value) {
        results.push("<div class=\"fc-tip-" + (label.toLowerCase()) + "\">\n  <span class=\"label\">" + label + ":</span>\n  " + value + "\n</div>");
      }
    }
    return results;
  })();

  // Position, inject tooltip text, and fade tooltip in
  $tip.offset({
    top: $item.offset()["top"] - 20,
    left: $item.offset()["left"] - $tip.width() - 40
  }).html(eventText).stop().fadeTo(200, 1);
};

// Hide the tooltip
tooltipHide = function(event, jsEvent, view) {
  $tip.stop().fadeTo(400, 0);
};

// Set class on past/present events
adjustClasses = function(event, element, view) {
  var past, url;
  if (!event.end) {
    past = event.start.isBefore(now);
  } else {
    past = event.end.isBefore(now);
  }
  if (past) {
    $(element[0]).addClass('old').attr('href', url);
  } else {
    $(element[0]).addClass('current').attr('href', url);
  }

};

$(document).ready(function() {
  var adjustClasses, tooltipHide, tooltipShow, $tip, tip, $widget, now;
  now = Date.now();
  $widget = $("#calendar");

  // Create tooltips on events
  tip = '<div id="fc-tooltip" class="fc-tooltip hidden"></div>';
  $tip = $(tip).appendTo($widget).hide().removeClass('hidden');

  $widget.fullCalendar({
    editable: false,
    eventLimit: 4,
    contentHeight: "auto",
    timezone: "local",
    firstDay: 1,
    header: {
      left: "title",
      center: "",
      right: "today prev,next",
    },
    dayRender: function (date, cell) {
      var today = new Date();
      if (date.date() === today.getDate() && date.month() === today.getMonth()) {
        cell.css("background-color", "lightgrey");
      }
    },
    eventMouseover: tooltipShow,
    eventMouseout: tooltipHide,
    eventRender: adjustClasses,
    eventSources: [
    {
      events:
      {{ site.data.events | fix_calendar_dates | filter_json_events }},
      overlap: true
    }
    ]
  })
});

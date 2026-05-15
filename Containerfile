FROM docker.io/library/ruby:3.4-alpine
WORKDIR /srv/jekyll

RUN apk add --no-cache build-base

COPY Gemfile ./
RUN bundle install

EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--watch"]

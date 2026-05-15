FROM docker.io/library/ruby:3.1-alpine

WORKDIR /srv/jekyll

# Install build dependencies
RUN apk add --no-cache build-base

# Install bundler
RUN gem install bundler

# Copy Gemfile for dependency installation
COPY Gemfile ./

# Install gems
RUN bundle install

# Copy the rest of the site
COPY . .

# Expose Jekyll port
EXPOSE 4000

# Run Jekyll serve
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--watch"]

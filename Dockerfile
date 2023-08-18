FROM ruby:3.1.2-alpine as base

RUN apk update && \
    apk add --virtual build-essential build-base libpq-dev tzdata node

WORKDIR /docker/app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

ADD . /docker/app

ARG DEFAULT_PORT 3000

EXPOSE ${DEFAULT_PORT}

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

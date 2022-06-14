FROM public.ecr.aws/docker/library/ruby:3.1.1-alpine3.15 AS base

RUN apk --update add build-base tzdata postgresql-dev postgresql-client curl

WORKDIR /app

RUN gem install bundler

FROM base AS prod

ENV RAILS_ENV=production
ENV SECRET_KEY_BASE='secret'
ENV BUNDLE_WITHOUT "development test"

COPY . .

RUN bundle exec rake assets:precompile

CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]

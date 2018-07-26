FROM ruby:2.5.1

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY ./Gemfile $APP_HOME
COPY ./Gemfile.lock $APP_HOME
RUN bundle install --system --binstubs

COPY . $APP_HOME

EXPOSE 5000

CMD bundle exec rackup config.ru --h 0.0.0.0 -p 5000

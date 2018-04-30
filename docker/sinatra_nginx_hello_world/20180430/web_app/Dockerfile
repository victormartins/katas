FROM ruby:2.5.1

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME
COPY Gemfile.lock $APP_HOME
RUN bundle install --system --binstubs

COPY . $APP_HOME

# The EXPOSE command will only make the port visible inside the docker network, but not to the host system
EXPOSE 4567

CMD bundle exec rackup config.ru --host 0.0.0.0 -p 4567

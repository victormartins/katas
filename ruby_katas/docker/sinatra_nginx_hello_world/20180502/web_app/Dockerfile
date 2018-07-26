FROM ruby:2.5.1

ENV WORKDIR /usr/src/app
RUN mkdir -p $WORKDIR
WORKDIR $WORKDIR

COPY Gemfile $WORKDIR
COPY Gemfile.lock $WORKDIR
RUN bundle install --system --binstubs

COPY . $WORKDIR

EXPOSE 5000

CMD bundle exec rackup config.ru -o 0.0.0.0 -p 5000

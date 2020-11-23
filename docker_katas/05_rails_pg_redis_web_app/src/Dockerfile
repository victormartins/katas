FROM ruby:2.6.4

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./

CMD ["bundle", "exec", "rackup", "-s", "puma", "--host", "0.0.0.0", "--port", "9292"]

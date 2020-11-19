FROM ruby:2.7.2

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]

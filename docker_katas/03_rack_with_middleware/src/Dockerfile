FROM ruby:2.7.2

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./

CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "-p", "8080"]

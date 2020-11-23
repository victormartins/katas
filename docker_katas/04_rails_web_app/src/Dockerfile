FROM ruby:2.6.4

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["bundle", "exec", "./bin/rails", "s", "-b", "0.0.0.0", "-p", "3000"]

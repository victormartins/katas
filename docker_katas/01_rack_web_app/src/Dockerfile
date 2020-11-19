FROM ruby:2.7.2

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

# Cache bundle step by running it before copying the app files
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy App Files
COPY . .

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0",  "-p", "8080"]

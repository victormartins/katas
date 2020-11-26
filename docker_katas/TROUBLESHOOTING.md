# Troubleshooting

# Can't Acces the dockerized WebService
- Make sure we binded the server ip to 0.0.0.0 in the Dockerfile
  eg:
  ```
  CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "-p", "8080"]
  ```
  For Rails we have to use the -b option:
  ```
  CMD ["bin/rails", "s", "-b", "0.0.0.0"]
  ```
- Make sure docker-compose exposes the port of the webserver insider docker to the outside world
    Eg: Mapping the default port of Rack `8080` to my host machine `9001`
    ```
    ports:
      - 9001:8080
    ```

# Service Logs not showing in docker logs.
## Rails Logs
Make sure we have this code in the environment configuration eg: `environments/development.rb`
and that the ENV `RAILS_LOG_TO_STDOUT` is set.
```ruby
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
```
## Ruby Logs
By default, Ruby buffers output to stdout, which doesn’t play well with Docker Compose.
To fix this we need to add the following command:
```
$stdout.sync = true

```
In rails this typically goes to the top of `config/boot.rb`.
I also saw that this works when set inside `config.ru`


# How to use pry with docker?
# How to connect MySQL pro to a DB running in docker?
# How do I backup my database volume?
# How do can I share a database volume accross diffent applications?

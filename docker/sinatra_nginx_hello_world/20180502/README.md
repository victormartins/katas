Create a Web Application in Sinatra with a route /hello_world that displays hello world.
Use nginx has a web server and redirect port 80 to the port used by Sinatra.


Add a web application service
  - make the root ./web_app
  - add a Gemfile and install Sinatra and Puma
    $ bundle init
  - configure Puma to use 2 threads and 4 workers
    . added a file config/puma.rb
  - set Puma environment to test. Use RACK_ENV for it and make it mandatory (Raise if not found)
  - bind Puma to TCP 0.0.0.0 port 5000
  - build an endpoint that shows a page made in erb displaying Hello World
    . added a config.ru file that will load Bundler.setup then require and started the app
    $ bundle exec rackup config.ru -o 0.0.0.0 -p 5000 This will call the puma.rb file
  - add a Dockerfile and start with a Ruby 2.5.1 image
  - make the home directory be /usr/src/app
  - add code to install the gems
  - copy the application files
  - configure the image to boot sinatra at port 5000 and expose it to docker only and not the host machine

Add a reverse proxy with nginx
  - make the root ./proxy
  - make sure to delete the default.conf file from nginx
  - add a new configuration file named my_nginx_settings.conf
  - route requests to the web_app and expose them in port 2000

Write a docker compose (V3)
  - web_app
    - configure the image to have the name web_app_kata_image
    - configure the container to have the name web_app_kata_container
  - proxy
    - configure the image to have the name nginx_kata_image
    - configure the container to have the name nginx_kata_container
Boot the containers
Test the page in the browser
Test the page in curl
Delete the new images



-------------------------
--- COMMANDS EXECUTED ---
-------------------------

docker-compose build . (builds the web_app and proxy image)
docker-compose up  (runs the images and we can see the logs in the console)
curl -I http://localhost:2000/hello_world
docker-compose down

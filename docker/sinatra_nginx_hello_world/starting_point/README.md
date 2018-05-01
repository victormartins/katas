Create a Web Application in Sinatra with a route /hello_world that displays hello world.
Use nginx has a web server and redirect port 80 to the port used by Sinatra.


Add a web application service
  - make the root ./web_app
  - add a Gemfile and install Sinatra and Puma
  - build an endpoint that shows a page saying hello world
  - add a Dockerfile and start with a Ruby 2.5.1 image
  - create an image with the application files
  - configure the image to boot sinatra at port 5000 and expose it to docker only and not the host machine
  - configure the image to have the name web_app_kata_image
  - configure the container to have the name web_app_kata_container
  - configure Puma to use 2 threads and 4 workers
  - bind puma to TCP , 0.0.0.0
  - set RACK_ENV to test. Make it mandatory (Raise if not found)

Add a reverse proxy with nginx
  - make the root ./proxy
  - configure the image to have the name nginx_kata_image
  - configure the container to have the name nginx_kata_container
  - make sure to delete the default.conf file from nginx
  - add a new configuration file named my_nginx_settings.conf
  - route requests to the web_app and expose them in port 2000

Write a docker compose (V3)
Boot the containers
Test the page in the browser
Test the page in curl
Delete the new images

Create a Web Application in Sinatra with a route /hello_world that displays hello world.
Use nginx has a web server and redirect port 80 to the port used by Sinatra.
Use docker to contain both Web Application and Web Server. Have docker-compose configuring both applications.



------------------------------------------

1 - Pull in the images needed by creating the docker-compose file.
2 - Create the hello world Sinatra App in a local folder
3 - Crete a docker image with the app
  - create a Dockerfile
  - Specifiy the work directory
  - Copy the gem files to the work directory
  - Run bundler
  - copy the app files
  - change the docker-compose file to build the image

4 - configure nginx to proxy the web_app
  - create a folder and a Dockerfile for it
  - Delete the default configuration file inside the nginx image
  - Create an nginx config file based from here: http://ruby-journal.com/how-to-setup-rails-app-with-puma-and-nginx/
  - copy the new configuration to the nginx engine

5 - test in the browser
  - http://localhost/hello_world

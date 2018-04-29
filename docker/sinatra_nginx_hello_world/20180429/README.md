Create a Web Application in Sinatra with a route /hello_world that displays hello world.
Use nginx has a web server and redirect port 80 to the port used by Sinatra.
Use docker to contain both Web Application and Web Server. Have docker-compose configuring both applications.



------------------------------------------

Pull in the images I need to work with by creating the docker-compose file:

version: "3"
services:
  my_nginx_kata:
    image: nginx:alpine
    ports:
      - "80:80"


  my_web_app_kata:
    image: ruby:2.5.1-alpine3.7

Create the hello world Sinatra App in a local folder

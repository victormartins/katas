Create a docker container that functions as nginx webserver.
Add a custom index page to the server and see it in the browser

Commands used:
docker build -t my_page_nginx_kata .
docker run --name my_page_nginx_kata_container -d -p 80:80 my_page_nginx_kata
browser -> localhost:80

Cleaup:
docker container rm -f my_page_nginx_kata_container
docker image rm my_page_nginx_kata

FROM nginx:alpine
# Remove default nginx configuration files
RUN /bin/sh -c 'rm /etc/nginx/conf.d/default.conf'
# Copy my configuration file
COPY my_app_configurations.conf /etc/nginx/conf.d/

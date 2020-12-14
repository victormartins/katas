# Files generated inside the container will have the root ownership locally.
# This script should change it to use the current user and group
sudo chown "$USER:$USER" -R ./src

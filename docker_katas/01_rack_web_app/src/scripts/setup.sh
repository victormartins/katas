# --rm Automatically remove the container when it exit
# -v   Bind mount a volume
# -w   set the working directory
# bundle with this ruby version
# command to run

docker run  \
  --rm \
  -v   "$PWD":/usr/src/app \
  -w   /usr/src/app \
  ruby:2.7.2 \
  bundle install

docker-compose build

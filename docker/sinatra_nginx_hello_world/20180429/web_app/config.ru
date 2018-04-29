
# frozen_string_literal: true

require 'bundler'
Bundler.setup

# TODO: is this the right way to load the server or do we need a gemspec or environment folder?
require './hello_world_app'

hello_world_app = HelloWorldApp.new
run hello_world_app

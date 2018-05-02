# frozen_string_literal: true

require 'bundler'
Bundler.setup

require './hello_world_app'

app = HelloWorldApp.new
run app

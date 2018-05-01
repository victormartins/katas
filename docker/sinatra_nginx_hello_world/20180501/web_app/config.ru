# frozen_string_literal: true

require 'bundler'
Bundler.setup

# TODO: is this the right way to load the server or do we need a gemspec or environment folder?
require './my_web_app'

app = MyWebApp.new
run app

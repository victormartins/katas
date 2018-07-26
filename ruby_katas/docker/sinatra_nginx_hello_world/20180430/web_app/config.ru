# frozen_string_literal: true

require 'bundler'
Bundler.setup

# TODO: is this the right way to load the server or do we need a gemspec or environment folder?
require './my_app'

my_app = MyApp.new
run my_app

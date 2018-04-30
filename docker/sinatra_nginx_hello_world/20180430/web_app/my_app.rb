# frozen_string_literal: true

require 'sinatra'

class MyApp < Sinatra::Base
  get '/' do
    'home'
  end

  get '/hello_world' do
    erb :hello_world
  end
end

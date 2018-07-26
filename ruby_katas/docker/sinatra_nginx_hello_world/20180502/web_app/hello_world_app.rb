require 'sinatra'

class HelloWorldApp < Sinatra::Base
  get '/hello_world' do
    erb :hello_world
  end
end

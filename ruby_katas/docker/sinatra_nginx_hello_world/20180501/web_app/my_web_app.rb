require 'sinatra'

class MyWebApp < Sinatra::Base
  get '/hello_world' do
    erb :hello_world
  end
end

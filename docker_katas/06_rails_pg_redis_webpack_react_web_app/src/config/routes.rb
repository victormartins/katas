Rails.application.routes.draw do
  get '/homepage', to: 'homepage#index'
  root to: "homepage#index"
end

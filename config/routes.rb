Rails.application.routes.draw do
  resources :posts
  post '/messages/api/', to: 'posts#new'
  get '/messages/api/', to: 'posts#new'
  get '/messages/api/:id', to: 'posts#show'
  root 'posts#new'
end

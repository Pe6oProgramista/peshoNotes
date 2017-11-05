Rails.application.routes.draw do
  resources :posts
  get '/notes/api', to: 'posts#new'
  get '/notes/api/:id', to: 'posts#show'
  root 'posts#new'
end

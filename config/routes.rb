Rails.application.routes.draw do
  resources :posts
  get '/notes/api', to: 'posts#new'
  root 'posts#new'
end

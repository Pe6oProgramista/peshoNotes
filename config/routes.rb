Rails.application.routes.draw do
  resources :posts
  get 'posts/:id/send', to: 'posts#send'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

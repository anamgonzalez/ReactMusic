Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'results#search'
  get   'search'  => 'results#search'
  post  'search'  => 'results#search'
  resources :albums, only: [:show]
  resources :artists, only: [:show]
  resources :labels, only: [:show]
end

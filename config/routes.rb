Rails.application.routes.draw do
  get 'boards/view'

  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'boards#view'
  get 'vote/new' => 'votes#new'
  get 'vote/login' => 'votes#login'
  get 'vote/index' => 'votes#index'
  post 'vote/create' => 'votes#create'
  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  delete '/sessions/delete' => 'sessions#unsub'
  get 'boards/top'  => 'boards#view'
  post 'boards/top' => 'boards#create'
  get 'boards/page' => 'boards#page'
  delete 'boards/delete' => 'boards#destroy'
  resources :users
end

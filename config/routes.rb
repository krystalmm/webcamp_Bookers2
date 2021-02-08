Rails.application.routes.draw do

  get 'users/show'
  root 'homes#top'
  get '/home/about' => 'homes#about' 
  
  devise_for :users
  resources :users, only: [:show]
  
  resources :books, only: [:create, :index, :show, :destroy]

end

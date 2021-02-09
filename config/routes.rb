Rails.application.routes.draw do

  get 'users/show'
  root 'homes#top'
  get '/home/about' => 'homes#about' 
  
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  
  resources :books, only: [:create, :index, :show, :destroy]

end

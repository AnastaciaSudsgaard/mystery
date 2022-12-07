Rails.application.routes.draw do
  devise_for :login_users
  resources :login_users, only: [:show]
  resources :time_lists do
    resources :time_items
  end
  namespace :time_list do
    resources :time_items
  end
  resources :messages
  resources :rooms
  resources :todo_lists do
    resources :todo_insides
  end
  namespace :todo_list do
    resources :todo_insides
  end
  resources :todo_lists do
    resources :todo_ins
  end
  namespace :todo_list do
    resources :todo_ins
  end
  resources :books

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

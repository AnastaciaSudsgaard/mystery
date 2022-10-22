Rails.application.routes.draw do
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

  root 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

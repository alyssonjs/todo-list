Rails.application.routes.draw do
  resources :todo_lists do
    resources :todo_items
  end
  namespace :todo_list do
    resources :todo_items
  end
  resources :categories do
  end
  namespace :category do
  end
  resources :users do
  end
  namespace :user do
  end


  # get '/' => 'collaborators#index'
  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'
  post '/sessions' =>  'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

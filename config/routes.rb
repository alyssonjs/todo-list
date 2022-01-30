Rails.application.routes.draw do
  resources :users

  resources :categories do
    resources :todo_lists do
      resources :todo_items
    end
  end


  post '/users' => 'users#create'
  get '/' => 'categories#index'
  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'
  post '/sessions' =>  'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :users, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do   
      resources :projects
      resources :skills
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end

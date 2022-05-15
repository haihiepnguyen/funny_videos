Rails.application.routes.draw do
  root "videos#index"
  devise_for :users
  resources :users do
    collection do
      delete :destroy_session
    end
  end
  resources :videos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

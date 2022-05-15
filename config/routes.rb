Rails.application.routes.draw do
  root "videos#index"
  devise_for :users
  resources :users do
    collection do
      delete :destroy_session
    end
  end
  resources :videos do
    member do
      post :like
      post :dislike
      post :undo_react
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

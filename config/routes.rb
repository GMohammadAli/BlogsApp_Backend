Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do 
    resources :blogs do
      resources :likes,  only: [ :show, :create, :update ]
      resources :comments
    end
  end
end

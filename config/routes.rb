Rails.application.routes.draw do
  resources :users do 
    resources :blogs do
      resources :likes,  only: [ :index, :create, :update , :destroy ]
      resources :comments
    end
  end
  post '/auth/login', to: 'authentication#login'
end

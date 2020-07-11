Rails.application.routes.draw do
  resources :categories, only: %i[show index]
  root 'homes#index'

  namespace :admin do 
    get '/login', to: 'sessions#new'
    post '/sessions', to: 'sessions#create'
    delete '/sessions', to: 'sessions#destroy'

    root 'application#index'
    resources :categories, except: [:show]
    resources :products do
      resources :images, only: %i[destroy create], controller: 'products/images'
    end
  end
end

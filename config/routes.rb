Rails.application.routes.draw do
  resources :videos
  resources :class_types
  # get 'users/profile'
  get 'studio' => 'studio#show'

  authenticated :user, ->(user) { user.admin? } do
    get 'users', to: 'users#users'
    get '/u/:id', to: 'users#profile', as: 'user'
    get '/u/:id', to: 'users#edit_role', as: 'edit_role'
    
  end

  resources :gfcs do
    resources :workout_blocks
  end
  resources :gfcs do
    member do
      get :my_classes
    end
    member do
      post :send_to_display
      patch :send_to_display
    end
  end

  get 'my_classes' => 'gfcs#my_classes'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "gfcs#index"
end

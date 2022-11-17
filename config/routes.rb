Rails.application.routes.draw do
  get 'users/profile'
  get 'studio' => 'studio#show'

  resources :gfcs do
    resources :workout_blocks
  end
  resources :gfcs do
    member do
      post :send_to_display
      patch :send_to_display
    end
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/u/:id', to: 'users#profile', as: 'user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "gfcs#index"
end

Pomodomo::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # Defaults to home controller's index
  root :to => 'home#index'

  resources :users do
    member do
      get 'profile'
    end
  end

  resources :pomodoros

end

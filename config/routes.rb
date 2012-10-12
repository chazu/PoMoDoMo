Pomodomo::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # Defaults to home controller's index
  root :to => 'home#index'

end

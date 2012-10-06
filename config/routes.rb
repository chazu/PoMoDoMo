Pomodomo::Application.routes.draw do
  devise_for :users

  # Defaults to home controller's index
  root :to => 'home#index'

end

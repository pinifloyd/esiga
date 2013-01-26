Esiga::Application.routes.draw do

  devise_for :users, skip: :registrations, controllers: {
    sessions: 'authentication/sessions'
  }

  root to: 'home#index'

  namespace :admin do
    root to: 'home#index'
    resources :categories
  end

end

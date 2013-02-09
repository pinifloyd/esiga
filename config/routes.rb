Esiga::Application.routes.draw do

  devise_for :users, skip: :registrations, controllers: {
    sessions:  'authentication/sessions',
    passwords: 'authentication/passwords'
  }

  root to: 'home#index'

  resources :categories, only: :show

  namespace :admin do
    root to: 'dashboard#index'
    resources :categories, except: :show
    resources :products
  end

end

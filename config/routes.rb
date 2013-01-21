Esiga::Application.routes.draw do

  devise_for :users, skip: :registrations

  root to: 'home#index'

  namespace :admin do
    root to: 'home#index'
    resources :categories
  end

end

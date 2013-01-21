Esiga::Application.routes.draw do

  root to: 'home#index'

  namespace :admin do
    root to: 'home#index'
    resources :categories
  end

end

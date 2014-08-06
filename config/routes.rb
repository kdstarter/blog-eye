Rails.application.routes.draw do

  namespace :frontend, path: '/' do
    root 'home#index'

    resources :users
  end
end

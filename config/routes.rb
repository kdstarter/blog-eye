Rails.application.routes.draw do

  namespace :frontend, path: '/' do
    root 'home#index'

    resources :users
  end

  namespace :admin, path: '/admin' do
    root 'home#index'
  end
  
end

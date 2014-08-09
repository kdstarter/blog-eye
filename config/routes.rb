Rails.application.routes.draw do
  
  devise_for :users, path: 'admin'

  namespace :frontend, path: '/' do
    root 'home#index'

    resources :users
  end

  namespace :admin, path: '/admin' do
    root 'home#index'
    
  end
  
end

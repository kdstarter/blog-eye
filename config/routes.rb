Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: 'admin'

  namespace :frontend, path: '/' do
    root 'home#index'

    resources :users

    resources :posts
  end

  namespace :admin, path: '/admin' do
    root 'home#index'
    
    resources :posts

    resources :categories
  end
  
end

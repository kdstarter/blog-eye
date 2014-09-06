Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # devise_for :users, path: 'user'
  devise_for :users, path: 'user', controllers: {registrations: "users/registrations"}
  devise_scope :user do
    post '/admin/is_uid_exist', to: 'users/registrations#is_uid_exist'
  end

  get 'update_captcha', to: 'simple_captcha#update_captcha'

  namespace :admin, path: '/admin' do
    root 'home#index'

    get '/profile', to: 'home#profile'
    post '/update_profile', to: 'home#update_profile'

    resources :messages do
      post 'mark_as_read', to: 'messages#mark_as_read'
    end

    resources :posts

    resources :replies

    resources :categories

    resources :codes
  end

  namespace :frontend, path: '/' do
    root 'home#index'

    resources :posts do
      resources :replies
    end

    scope ":uid" do
      get "/", to: 'users#show'
      get '/profile', to: 'users#profile'

      resources :categories

      resources :codes
    end
  end
  
end

Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  get 'update_captcha', to: 'simple_captcha#update_captcha'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, path: 'user', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post '/admin/is_uid_exist', to: 'users/registrations#is_uid_exist'
  end

  require 'sidekiq/web'
  constraint = lambda { |request|
    # config.default_scope in file devise.rb effects request.env['warden'].user
    request.env["warden"].authenticate? and request.env['warden'].user.instance_of?(AdminUser)
  }
  constraints constraint do
    mount Sidekiq::Web => 'system/sidekiq' # only for system user
  end

  namespace :admin, path: '/admin' do
    root 'home#index'

    get '/profile', to: 'home#profile'
    post '/update_profile', to: 'home#update_profile'

    resources :messages, only: [:show, :destroy, :index] do
      member do
        post 'mark_as_read', to: 'messages#mark_as_read'
      end
    end

    resources :posts

    resources :replies, only: [:destroy, :index] do
      member do
        post 'hide', to: 'replies#hide'
        post 'restore', to: 'replies#restore'
      end
    end

    resources :categories, except: [:new]

    resources :codes
  end

  namespace :frontend, path: '/' do
    root 'home#index'

    get 'site/about', to: 'home#about'

    get 'onliners/index', to: 'onliners#index'

    resources :blogs, only: [:show, :index]

    resources :posts, only: [:show] do
      resources :replies, only: [:create]
    end

    scope ':uid' do
      get '/', to: 'users#show'
      get '/profile', to: 'users#profile'

      resources :categories, only: [:show]

      resources :codes, only: [:show, :index]
    end
  end

end

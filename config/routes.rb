Rails.application.routes.draw do

  devise_for :users
  resources :feedbacks
  resources :posts
  resources :rooms do
    resources :meetings
  end

  resources :users

  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)

  root 'welcome#index'
end

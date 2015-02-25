Rails.application.routes.draw do

  resources :feedbacks

  resources :posts

  devise_for :users

  resources :rooms do
    resources :meetings
  end

  resources :users

  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)

  root 'welcome#index'
end

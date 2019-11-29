Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server => "/cable"

  root to: 'pages#home'
  get 'about', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact

  resources :users, only: [ :index, :show ] do
    resources :messages, only: [ :new, :create ]
  end

  resources :posts, only: [ :index, :new, :create, :destroy ] do
    resources :excludeds, only: [ :create ]
  end
end

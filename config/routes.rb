Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :new, :create, :destroy]
end

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'about-me', to: 'pages#about'
  post 'contact', to: 'pages#create'
  get 'contact/new', to: 'pages#new'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  root to: 'pages#home'
end

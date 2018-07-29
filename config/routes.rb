Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'about-me', to: 'pages#about' do
    put :sort, on: :collection
    
  end
  
  get 'tech-news', to: 'pages#tech_news'
  
  resources :refs do
    member do
      get :toggle_status
    end
  end
  
  resources :contacts,  only: [:new, :create]
  resources :topics,  only: [:index]
  resources :blogs do
    member do
      get :toggle_status
    end
    collection do
  		get 'search'
  	end
  end
  
  get 'tags/:tag', to: 'blogs#index', as: :tag
  
  mount ActionCable.server => '/cable'
  
  root to: 'pages#home'
end

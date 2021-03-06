Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only:[:show, :edit, :update]

  resources :shops, only:[:new, :create, :update, :edit, :show] do
    resources :events, only:[:new, :create, :edit, :update]
  end

  resources :events, only:[:show] do
    resources :favorite_events, only:[:create]
  end

  resources :favorite_events, only:[:destroy]

  get 'dashboard', to: 'pages#dashboard'
  get 'dashboard/events', to: 'pages#events'
  patch 'events/:id', to: 'events#updatebuyers', as: :update_buyers
end

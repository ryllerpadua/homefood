Rails.application.routes.draw do
  devise_for :users
  resources :products do
    resources :orders
  end
  resources :orders, only: :show
  root to: 'pages#home'
end

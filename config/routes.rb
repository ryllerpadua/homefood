Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :orders do
    resources :products, only: %i[new create destroy]
  end
end

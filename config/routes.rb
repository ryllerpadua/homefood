Rails.application.routes.draw do
  devise_for :users
  resources :products, only: %i[index new create edit update destroy show]
  root to: 'pages#home'
end

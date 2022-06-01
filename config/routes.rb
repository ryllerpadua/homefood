Rails.application.routes.draw do
  devise_for :users
  resources :products, only: %i[index new create edit update destroy show]
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'welcome/home'
  root to: 'welcome#home'

  get "/users/my_boards", to: "users#my_boards"
  
  resources :messages
  resources :boards
  resources :users
  delete "/memberships", to: "memberships#delete"
  resources :memberships

  post "/user_board", to: "boards#user_convo"

end

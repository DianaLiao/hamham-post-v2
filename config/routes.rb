Rails.application.routes.draw do
  devise_for :users 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_up' => 'devise/registrations#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'welcome/home'
  root to: 'welcome#home'

  get "/users/my_boards", to: "users#my_boards"
  
  get "/messages/:id", to: "messages#destroy", as: "delete_message"
  resources :messages
  resources :boards
  resources :users
  delete "/memberships", to: "memberships#delete"
  resources :memberships

  post "/user_board", to: "boards#user_convo"
  post "/welcome/marquee", to: "welcome#set_marquee"
  post "/boards/personal", to: "boards#positive_message"

end

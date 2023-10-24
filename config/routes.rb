Rails.application.routes.draw do
  root 'top#main'
  get 'top/main', to: 'top#main'
  post 'login', to: 'application#create', as: 'login'
  get 'logout', to: 'application#logout', as: 'logout'
end

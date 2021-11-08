Rails.application.routes.draw do
  get "login" , to: 'user#login', as: "login_url"
  post "login" , to: 'user#login'
  get "logout" , to: 'user#logout', as: "logout_url" 
  resources :projects
  resources :employees
end

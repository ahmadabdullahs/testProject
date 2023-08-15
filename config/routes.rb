Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users

  resources :projects do
   resources :bugs
  end
end

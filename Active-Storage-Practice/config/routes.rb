Rails.application.routes.draw do
  resources :profiles 
  resources :messages, only: [:index, :show, :create]
end

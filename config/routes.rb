Rails.application.routes.draw do
  resources :plans
  resources :documents
  root "plans#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

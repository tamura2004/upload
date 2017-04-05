Rails.application.routes.draw do

  get "plans/new", to: "plans#new"
  get "plans", to: "plans#index"
  post "plans", to: "plans#create"
  root "plans#new"

end

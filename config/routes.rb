Rails.application.routes.draw do
  root "static_pages#home"
  get "about" => "static_pages#about"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end

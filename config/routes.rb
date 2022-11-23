Rails.application.routes.draw do
  resources :tutorials
  root "pages#home"
  get "about", to: "pages#about"
end

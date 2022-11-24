Rails.application.routes.draw do
  resources :tutorials
  root "pages#home"
  get "about", to: "pages#about"
  get "tutorials/category/:category", to: "tutorials#list", as: "category"
end

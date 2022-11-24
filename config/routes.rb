Rails.application.routes.draw do
  resources :tutorials
  root "pages#home"
  get "about", to: "pages#about"
  get "tutorials/category/:category", to: "tutorials#list", as: "category"
  get "tutorials/author/:author", to: "tutorials#list_by_author", as: "author"
end

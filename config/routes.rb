Rails.application.routes.draw do
  resources :tutorials
  root "pages#home"
  get "about", to: "pages#about"
  get "tutorials/category/:category", to: "tutorials#list_by_category", as: "category"
  get "tutorials/author/:author", to: "tutorials#list_by_author", as: "author"
  put "/upvote/:id", to: "tutorials#upvote", as: "tutorial_upvote"
  put "/downvote/:id", to: "tutorials#downvote", as: "tutorial_downvote"
end

Rails.application.routes.draw do
  devise_for :users
  root to: "static#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :my do
    patch "/recipes/:id/remove_image", to: "recipes#remove_image", as: "recipe_image_remove"
    resources :recipes
  end
end

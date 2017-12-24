Rails.application.routes.draw do
  devise_for :users
  root to: "static#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :user do
    resources :recipes
  end
end
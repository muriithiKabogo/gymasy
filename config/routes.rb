Rails.application.routes.draw do
  devise_for :admins
  get 'static_pages/index'
  root 'static_pages#index'
  resources :gyms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

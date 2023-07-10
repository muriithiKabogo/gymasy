Rails.application.routes.draw do

  devise_for :members, path: 'members' ,controllers: { sessions: "members/sessions"}
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions"}
  get 'static_pages/index'
  root 'static_pages#index'
  resources :gyms
  resources :members, except: :create
  # Name it however you want
  post 'create_member' => 'members#create', as: :create_member
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  get 'memberships/new'
  get 'memberships/index'
  

  devise_for :members, path: 'members' ,controllers: { sessions: "members/sessions", registrations: "members/registrations" }
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", registrations: "admins/registrations" }
  get 'static_pages/index'
  get 'static_pages/settings'
  get 'static_pages/analytics'
  get 'static_pages/landing_page'
  root 'static_pages#index'
  resources :gyms
  resources :members, except: :create
  # Name it however you want
  post 'create_member' => 'members#create', as: :create_member
  resources :checkins
  resources :membership_types
  resources :memberships


  get '/member' => "members#index", :as => :member_root
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

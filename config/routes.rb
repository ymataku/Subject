Rails.application.routes.draw do
  get 'document/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
 
  # get 'user/show/' => 'user#show' ,as: :mypage
  # get '/user/show/:id', to: 'user#show', as: 'patient'
 
  # get 'subject/index'
  # get 'subject/show'
  # get 'home/index'
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :user, only: [:show] 
  # get  '/user/:id' ,to: 'user#show',as: 'user'
  
  # Defines the root path route ("/")
  # root "articles#index"
  resources:subject
  
  resources:document 
  

  # get 'document/index/'
  post "document/new" => "document#create"

  root to: "home#index"
end

Rails.application.routes.draw do
  #get 'finder/index'

  get '/products/category/:category' => 'finder#category', as: 'category'
  get '/products/search/' => 'finder#search', as: 'search'
  get '/products/search_category/' => 'finder#search_category', as: 'search_category'

  resources :products, controller: 'finder'
  root 'finder#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post '/donations/make_donation', to: 'donations#make_donation'

  resources :charity_projects, only: %i(index show)

  resources :gifts, only: :index

  resources :questionnaires, only: :show

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

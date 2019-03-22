Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post '/donations/make_donation', to: 'donations#make_donation'

  get '/charity_projects', to: 'charity_projects#get_all_charity_projects'
  get '/charity_projects/:id', to: 'charity_projects#get_charity_project'

  resources :gifts, only: ['index'] do
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  post '/donations/make_donation', to: 'donations#make_donation'

  get '/charity_projects', to: 'charity_project#get_all_charity_projects'
  get '/charity_projects/:id', to: 'charity_project#get_charity_project'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

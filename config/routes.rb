Rails.application.routes.draw do
  post 'donations/verify_order'

  get '/charity_projects', to: 'charity_project#getAllCharityProjects'
  get '/charity_projects/:id', to: 'charity_project#getCharityProjectInformation'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

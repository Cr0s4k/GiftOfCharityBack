class CharityProjectController < ApplicationController
  def get_all_charity_projects
    charity_projects = CharityProject.all.map do |charity_project|
      {
          id: charity_project.id,
          name: charity_project.name,
          price: charity_project.price,
          imageUrl: charity_project.imageUrl
      }
    end
    render json: charity_projects, status: 200
  end

  def get_charity_project
    charity_project = CharityProject.find(params[:id])
    render json: {
        id: charity_project.id,
        name: charity_project.name,
        price: charity_project.price,
        imageUrl: charity_project.imageUrl,
        description: charity_project.description
    }, status: :ok
  end
end

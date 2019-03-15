class CharityProjectsController < ApiController
  def get_all_charity_projects
    charity_projects = CharityProject.all.map do |charity_project|
      {
          id: charity_project.id,
          name: charity_project.name,
          imageUrl: charity_project.image_url
      }
    end
    render json: charity_projects, status: 200
  end

  def get_charity_project
    charity_project = CharityProject.find(params[:id])
    render json: {
        id: charity_project.id,
        name: charity_project.name,
        imageUrl: charity_project.image_url,
        description: charity_project.description
    }, status: :ok
  end
end

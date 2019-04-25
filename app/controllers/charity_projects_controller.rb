class CharityProjectsController < ApiController
  def index
    charity_projects = CharityProject.where(available: true).map do |charity_project|
      {
          id: charity_project.id,
          name: charity_project.name,
          imageUrl: charity_project.image_url
      }
    end
    render json: charity_projects, status: 200
  end

  def show
    charity_project = CharityProject.find_by!(id: params[:id], available: true)
    render json: {
        id: charity_project.id,
        name: charity_project.name,
        imageUrl: charity_project.image_url,
        description: charity_project.description,
        questionnaireId: charity_project.questionnaire_id
    }, status: :ok
  end
end

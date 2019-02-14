class CharityProjectController < ApplicationController
  def getAllCharityProjects
    allCharityProjects = CharityProject.all.map do |charityProject|
      {
          id: charityProject.id,
          name: charityProject.name,
          price: charityProject.price,
          imageUrl: charityProject.imageUrl
      }
    end
    render json: allCharityProjects, status: 200
  end

  def getCharityProjectInformation
    begin
      charityProject = CharityProject.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { message: "Charity project not found" }, status: :not_found
      return
    end
    render json: {
        id: charityProject.id,
        name: charityProject.name,
        price: charityProject.price,
        imageUrl: charityProject.imageUrl,
        description: charityProject.description
    }, status: 200
  end
end

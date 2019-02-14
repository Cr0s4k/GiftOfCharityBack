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
end

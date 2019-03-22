class AddAvailableToCharityProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :charity_projects, :available, :boolean, default: true
  end
end

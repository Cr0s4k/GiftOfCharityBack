ActiveAdmin.register CharityProject do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#
  index do
    selectable_column
    id_column
    column :name
    column "Image" do |product|
      link_to(image_tag(product.image_url, class: 'charityProjectsImage'), admin_charity_project_path(product))
    end
    column :image_url
    column :description
    column :created_at
    column :updated_at
    actions
  end
end

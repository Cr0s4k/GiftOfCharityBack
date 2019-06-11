ActiveAdmin.register CharityProject do
  include ActiveAdmin::AjaxFilter
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
  menu priority: 3
  permit_params :name, :image_url, :description, :available, :questionnaire_id

  index do
    selectable_column
    id_column
    column :name
    column :available
    column "Image" do |product|
      link_to(tag(:img, src: product.image_url, class: 'charityProjectsImage'), admin_charity_project_path(product))
    end
    # column :image_url
    column 'Description' do |product|
      cutText(product.description, 70)
    end
    column :questionnaire
    column :created_at
    # column :updated_at
    actions
  end

  filter :name
  filter :available
  filter :image_url
  filter :description
  filter :questionnaire, as: :ajax_select, data: {
      url: :filter_admin_questionnaires_path,
      search_fields: [:name],
      display_fields: [:name],
      limit: 5,
  }
  filter :created_at
  # filter :updated_at
end

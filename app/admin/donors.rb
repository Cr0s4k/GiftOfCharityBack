ActiveAdmin.register Donor do
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
  menu priority: 7
  actions :all, except: [:new]

  permit_params :email, :name

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :created_at
    # column :updated_at
    actions
  end

  filter :email
  filter :name
  filter :created_at
  # filter :updated_at
end

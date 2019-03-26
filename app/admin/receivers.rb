ActiveAdmin.register Receiver do
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
  actions :all, except: [:new, :destroy]

  permit_params :name, :address, :country, :province, :postcode, :city, tags_attributes: [:id]

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :country
    column :province
    column :postcode
    column :city
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :address
  filter :country
  filter :province
  filter :postcode
  filter :city
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :country, as: :string
      f.input :province
      f.input :postcode
      f.input :city
    end
    f.actions
  end
end

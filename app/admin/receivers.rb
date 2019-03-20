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

  permit_params :address, :country, :province, :postcode, :city, tags_attributes: [:id]

  form do |f|
    f.inputs do
      f.input :address
      f.input :country, as: :string
      f.input :province
      f.input :postcode
      f.input :city
    end
    f.actions
  end
end

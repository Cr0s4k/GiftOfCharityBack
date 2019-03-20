ActiveAdmin.register Donation do
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
  permit_params :amount, :donor_id, :charity_project_id, :gift_id

  index do
    id_column
    column 'Amount (€)', &:amount
    column :donor
    column :charity_project
    column :gift
    column :created_at
    column :updated_at
    actions
  end

  filter :amount
  filter :donor
  filter :charity_project
  filter :gift
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :amount
      f.input :donor, selected: Donor.first.id
      f.input :charity_project, selected: CharityProject.first.id
      f.input :gift, selected: Gift.first.id
    end
    f.actions
  end
end

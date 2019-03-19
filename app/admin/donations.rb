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

  index do
    id_column
    column 'Donor email' do |donation|
      donation.donor.email
    end
    column 'Amount (€)', &:amount
    column :charity_project
    column :created_at
    actions
  end

  filter :charity_project
  filter :donor
  filter :amount
  filter :created_at
end

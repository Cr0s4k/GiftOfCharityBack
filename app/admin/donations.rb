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
  filter :gift, as: :select, collection: proc{Gift.all.map{|r| r.id}}
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :amount
      f.input :donor
      f.input :charity_project
      f.input :gift, as: :select, collection: Gift.all.map{|r| r.id}
    end
    f.actions
  end
end

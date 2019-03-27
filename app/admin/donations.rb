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
  permit_params :amount, :charity_project_id,
                donor_attributes: [:id, :name, :email],
                gift_attributes: [:id, :sent, :seen, :video_url,
                                  receiver_attributes: [:id, :name, :address, :country, :province, :postcode, :city]]
  index do
    selectable_column
    id_column
    column 'Amount (€)', &:amount
    column :donor
    column :charity_project
    column :gift
    column :receiver
    column :created_at
    column :updated_at
    # actions
    actions defaults: false, only: [:edit] do |post|
      item "View", admin_donation_path(post.id), method: :get, class: 'member_link'
      item "Edit", edit_admin_donation_path(post.id), method: :get, class: 'member_link'
      item "Delete", admin_donation_path(post.id), method: :delete, class: 'member_link',
           data: {confirm: "The donor, gift and receiver associated will also be deleted! Are you sure?"}
    end
  end

  filter :amount
  filter :donor
  filter :charity_project
  filter :gift
  filter :receiver
  filter :created_at
  filter :updated_at

  form partial: 'form'

  sidebar :note, only: :index do
    'Once you delete a donation, its donor, gift and receiver associated will also be deleted!'
  end
end

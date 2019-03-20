ActiveAdmin.register Gift do
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
  permit_params :sent, :seen, :video_url, :receiver_id

  filter :sent
  filter :seen
  filter :token
  filter :secret_url
  filter :video_url
  filter :receiver
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :sent
      f.input :seen
      f.input :video_url
      f.input :receiver, selected: Receiver.first.id
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :sent
    column :seen
    column :token
    column :secret_url
    column :video_url
    column :receiver
    column :created_at
    column :updated_at
    actions
  end
end

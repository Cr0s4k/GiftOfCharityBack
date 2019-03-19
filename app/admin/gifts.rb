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

  filter :sent
  filter :seen
  filter :token
  filter :secret_url
  filter :video_url
  filter :receiver, as: :select, collection: proc {Receiver.all.map{|r| r.id}}
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :sent
      f.input :seen
      f.input :token
      f.input :secret_url
      f.input :video_url
      f.input :receiver, as: :select, collection: proc {Receiver.all.map{|r| r.id}}
    end
    f.actions
  end
end

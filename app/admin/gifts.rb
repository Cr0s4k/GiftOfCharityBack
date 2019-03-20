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
    actions defaults: true do |gift|
      item "Donwload PDF", download_admin_gift_path(gift.id), class: 'member_link'
      item "Mark as sent", mark_admin_gift_path(gift.id), class: 'member_link' unless gift.sent
    end
  end

  member_action :mark, method: :get do
    Gift.where(id: params[:id]).update(sent: true)
    redirect_to admin_gifts_path
  end

  member_action :download, method: :get do
    # PDF :D
    # fake_file = get('http://www.agirregabiria.net/g/sylvainaitor/principito.pdf')
    # send_file fake_file, type: "application/pdf", x_sendfile: true
    redirect_to admin_gifts_path
  end
end

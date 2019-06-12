ActiveAdmin.register Gift do
  include ActiveAdmin::AjaxFilter
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
#   belongs_to :donation
  menu priority: 5
  actions :all, except: [:new, :destroy]

  permit_params :sent, :seen, :video_url

  filter :sent
  filter :seen
  # filter :token
  filter :secret_url
  # filter :video_url
  filter :receiver, as: :ajax_select, data: {
      url: :filter_admin_receivers_path,
      search_fields: [:name],
      display_fields: [:name],
      limit: 5,
  }
  filter :donation, as: :ajax_select, data: {
      url: :filter_admin_donations_path,
      search_fields: [:id],
      display_fields: [:id],
      limit: 5,
  }
  filter :opened_at
  filter :created_at
  # filter :updated_at

  form do |f|
    f.inputs do
      f.input :sent
      f.input :seen
      f.input :video_url
    end
    f.actions
  end

  index do
    # selectable_column
    id_column
    column :sent
    column :seen
    # column :token
    column :secret_url
    # column 'Video Url' do |gift|
    #   cutText(gift.video_url, 40)
    # end
    column :receiver
    column :donation
    column :opened_at
    column :created_at
    # column :updated_at
    actions defaults: true do |gift|
      item "", download_admin_gift_path(gift.id), class: 'member_link download_pdf'
      item "", mark_admin_gift_path(gift.id), class: 'member_link mark_as_send' unless gift.sent
    end
  end

  controller do # In order to use helpers in member_action stuff
    include ActiveAdmin::GiftsHelper
  end

  member_action :mark, method: :get do
    Gift.find(params[:id]).update(sent: true)
    redirect_to admin_gifts_path
  end

  member_action :download, method: :get do
    gift = Gift.find(params[:id])
    pdf = generate_pdf(gift)
    send_file(
      pdf,
      filename: "Gift #{gift.id}.pdf",
      type: 'application/pdf'
    )
  end

  member_action :view_as_html, method: :get do
    gift = Gift.find(params[:id])
    render template: "gift_pdf/index", layout: "mailer", locals: { gift: gift }
  end

  action_item :download, only: :show do
    link_to 'Download PDF', download_admin_gift_path(gift.id)
  end

  sidebar :note, only: :index do
    'If you need to remove a gift, remove its donation instead.'
  end

  show do
    attributes_table do
      row :sent
      row :seen
      row :secret_url
      row :receiver
      row :donation
      row :opened_at
      row :created_at
    end
  end
end

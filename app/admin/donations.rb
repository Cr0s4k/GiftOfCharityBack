ActiveAdmin.register Donation do
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
  menu priority: 4
  config.action_items.delete_at(2)
  batch_action :destroy, false
  permit_params :amount, :charity_project_id,
                donor_attributes: [:id, :name, :email],
                gift_attributes: [:id, :sent, :seen, :video_url,
                                  receiver_attributes: [:id, :name, :address, :country, :province, :postcode, :city]]
  index do
    selectable_column
    id_column
    column 'Amount (€)', &:amount
    column :donor
    column :receiver
    column :charity_project
    column :gift
    column :created_at
    # column :updated_at
    # actions
    actions defaults: false, only: [:edit] do |post|
      item "View", admin_donation_path(post.id), method: :get, class: 'member_link'
      item "Edit", edit_admin_donation_path(post.id), method: :get, class: 'member_link'
      item "Delete", admin_donation_path(post.id), method: :delete, class: 'member_link',
           data: {confirm: "The donor, gift and receiver associated will also be deleted! Are you sure?"}
    end
  end

  filter :amount
  filter :donor, as: :ajax_select, data: {
      url: :filter_admin_donors_path,
      search_fields: [:name],
      display_fields: [:name],
      limit: 5,
  }
  filter :receiver, as: :ajax_select, data: {
      url: :filter_admin_receivers_path,
      search_fields: [:name],
      display_fields: [:name],
      limit: 5,
  }
  filter :charity_project, as: :ajax_select, data: {
      url: :filter_admin_charity_projects_path,
      search_fields: [:name],
      display_fields: [:name],
      limit: 5,
  }
  filter :gift, as: :ajax_select, data: {
      url: :filter_admin_gifts_path,
      search_fields: [:id],
      display_fields: [:id],
      limit: 5,
  }
  filter :created_at
  # filter :updated_at

  show do
    attributes_table do
      row :amount
      row :donor
      row :receiver
      row :charity_project
      row :gift
      row :created_at
      row :updated_at
    end
  end

  # form partial: 'new'

  controller do
    def new
      @donation = Donation.new
      render template: "admin/donations/_new", layout: "active_admin"
    end
  end

  collection_action :create_donation, method: :post do
    @donation = Donation.create(
      amount: params["donation"]['amount'],
      donor: Donor.create(
        name: params["donation"]["donor_attributes"]["name"],
        email: params["donation"]["donor_attributes"]["email"]
      ),
      gift: Gift.create(
        sent: params["donation"]["gift_attributes"]["sent"],
        seen: params["donation"]["gift_attributes"]["seen"],
        video_url: params["donation"]["gift_attributes"]["video_url"],
        receiver: Receiver.create(
          name: params["donation"]["gift_attributes"]["receiver_attributes"]["name"],
          address: params["donation"]["gift_attributes"]["receiver_attributes"]["address"],
          country: params["donation"]["gift_attributes"]["receiver_attributes"]["country"],
          province: params["donation"]["gift_attributes"]["receiver_attributes"]["province"],
          postcode: params["donation"]["gift_attributes"]["receiver_attributes"]["postcode"],
          city: params["donation"]["gift_attributes"]["receiver_attributes"]["city"]
        )
      ),
      charity_project_id: params["donation"]["charity_project_id"]
    )

    if @donation.save
      redirect_to admin_donation_path(@donation.id), notice: "Donation was successfully created."
      return
    end

    render template: "admin/donations/_new", layout: "active_admin"
  end

  sidebar :note, only: :index do
    'Once you delete a donation, its donor, gift and receiver associated will also be deleted!'
  end

  action_item :destroy, only: :show do
    link_to 'Delete Donation', admin_donation_path(donation.id), method: :delete, data: {confirm: "The donor, gift and receiver associated will also be deleted! Are you sure?"}
  end

  batch_action :remove, confirm: "Once you delete those donations, theirs donors, gifts and receivers associated will also be deleted!" do |ids|
    batch_action_collection.find(ids).each do |post|
      post.destroy
    end
    redirect_to collection_path, alert: "Successfully destroyed #{ids.length} donation#{'s' if ids.length > 1}"
  end
end

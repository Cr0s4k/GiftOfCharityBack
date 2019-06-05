ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do
      column do
        panel "Recent Donations" do
          table do
            thead do
              tr do
                ['Id', 'Donor Email', 'Charity Project', 'Amount (€)'].each &method(:th)
              end
            end
            tbody do
              Donation.last(10).map do |donation|
                tr do
                  td do
                    link_to donation.id, admin_donation_path(donation)
                  end
                  td do
                    link_to donation.get_donor.email, admin_donor_path(donation.get_donor)
                  end
                  td do
                    link_to donation.charity_project.name, admin_charity_project_path(donation.charity_project)
                  end
                  td do
                    donation.amount
                  end
                end
              end
            end
          end
        end
      end
      column do
        panel "Message" do
          para "Welcome to the administrator panel."
        end
      end
    end
  end # content
end

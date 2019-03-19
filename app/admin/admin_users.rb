ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :last_sign_in_at
    column :last_sign_in_ip
    column :sign_in_count
    actions
  end

  filter :email
  filter :last_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password unless f.object.new_record?
      f.input :password_confirmation unless f.object.new_record?
    end
    f.actions
  end

  sidebar :note, only: :new do
    'An email where the new administrator can set his password will be sent.'
  end
end

class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :trackable

  # Send an email where admins can set their password
  after_create do |admin|
    admin.send_reset_password_instructions
  end

  def password_required?
    new_record? ? false : super
  end

  # Dont let the system without admins
  before_destroy :raise_if_last

  def raise_if_last
    if AdminUser.count < 2
      raise 'Can not delete last admin user!'
    end
  end
end

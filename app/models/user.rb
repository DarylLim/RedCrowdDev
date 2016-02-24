class User < ActiveRecord::Base
  ROLES = %w(admin investor)

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      self.role == role_name
    end
  end

  before_validation :set_defaults_role

  private
    def set_defaults_role
      self.role = 'investor' if self.role.blank?
      true
    end
end

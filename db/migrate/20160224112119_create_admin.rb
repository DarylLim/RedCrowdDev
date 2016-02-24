class CreateAdmin < ActiveRecord::Migration
  def up
    User.create! email: 'admin@redcrowd.com', password: '11223344', password_confirmation: '11223344', role: 'admin'
  end

  def down
    User.where(email: 'admin@redcrowd.com').destroy_all
  end
end

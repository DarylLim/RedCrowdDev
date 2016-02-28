class AddFieldsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :registration_number, :string
    add_column :companies, :location, :string
    add_column :companies, :contact, :text
    add_column :companies, :website, :string
    add_column :companies, :description, :text
  end
end

class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :position
      t.text :biography
      t.string :picture

      t.timestamps null: false
    end
  end
end

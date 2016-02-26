class CreateRejectionReasons < ActiveRecord::Migration
  def change
    create_table :rejection_reasons do |t|
      t.text :content
      t.integer :company_id

      t.timestamps null: false
    end
  end
end

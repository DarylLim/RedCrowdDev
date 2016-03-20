class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :state
      t.string :kind    
      t.integer :company_id    
      t.decimal :amount_of_funding, :decimal, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end

class CreateFundingHistories < ActiveRecord::Migration
  def change
    create_table :funding_histories do |t|
      t.string   :kind
      t.decimal  :amount, :decimal, :precision => 8, :scale => 2
      t.date     :date
      t.integer  :company_id

      t.timestamps null: false
    end
  end
end

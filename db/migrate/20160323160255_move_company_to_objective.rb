class MoveCompanyToObjective < ActiveRecord::Migration
  def up
    remove_column :rejection_reasons, :company_id
  end

  def down
    add_column :rejection_reasons, :company_id, :integer
  end
end

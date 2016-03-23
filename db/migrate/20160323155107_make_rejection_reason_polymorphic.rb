class MakeRejectionReasonPolymorphic < ActiveRecord::Migration
  def up
    RejectionReason.destroy_all
    add_column :rejection_reasons, :objective_id, :integer
    add_column :rejection_reasons, :objective_type, :string
  end

  def down
    remove_column :rejection_reasons, :objective_id, :integer
    remove_column :rejection_reasons, :objective_type, :string
  end
end

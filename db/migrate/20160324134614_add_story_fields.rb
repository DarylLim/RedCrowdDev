class AddStoryFields < ActiveRecord::Migration
  def change
    add_column :campaigns, :pitch_image, :string
    add_column :campaigns, :pitch, :text

    remove_column :campaigns, :tags

  end
end

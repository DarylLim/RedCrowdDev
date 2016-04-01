class AddVideoUrlsToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :video_urls, :text
  end
end

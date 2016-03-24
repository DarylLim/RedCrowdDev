class AddFieldsToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :tagline, :text
    add_column :campaigns, :card_image, :string
    add_column :campaigns, :category, :string
    add_column :campaigns, :tags, :text
    add_column :campaigns, :deadline, :integer
    add_column :campaigns, :funding_type, :string
    add_column :campaigns, :facebook_shared_image, :string
    add_column :campaigns, :facebook, :string
    add_column :campaigns, :twitter, :string
    add_column :campaigns, :youtube, :string
    add_column :campaigns, :website, :string
    add_column :campaigns, :custom_short_url, :string
  end
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'


ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include Devise::TestHelpers, :type => :view
  config.extend ControllerMacros, :type => :controller
  config.extend ControllerMacros, :type => :view
  config.extend ModelStatusMacros, :type => :model

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end

class Investor::BaseController < ApplicationController
  before_action :authenticate_user!
  layout 'investor'
end

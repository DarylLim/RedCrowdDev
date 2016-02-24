class Investor::BaseController < ApplicationController
  layout 'investor'

  before_action :authenticate_user!
end

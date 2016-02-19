class Investor::BaseController < ApplicationController
  before_action :authenticate_user!

end

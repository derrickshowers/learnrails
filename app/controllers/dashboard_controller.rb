class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def main
  end
end
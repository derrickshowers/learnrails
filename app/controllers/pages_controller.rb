class PagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :about]
  
  def home
  end
  
  def about
  end
  
  def dashboard
  	#if !user_signed_in?
  	#	redirect_to :controller=>'pages', :action => 'home'
    #end
  end
end

class PagesController < ApplicationController
  
  def home
  	@pins = Pin.find(:all, :order => 'id')
  	@pinsLikes = Pin.find(:all, :order => 'likes DESC')
  end
  
end

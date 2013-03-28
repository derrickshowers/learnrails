class PagesController < ApplicationController
  
  def home
  	@pins = Pin.find(:all, :order => 'id')
  	@pinsLikes = Pin.find(:all, :order => 'likes DESC')
  	if user_signed_in?
  		@likedPins = User.find(current_user.id).likes;
  	end
  end
  
end

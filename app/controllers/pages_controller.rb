class PagesController < ApplicationController
  
  def home
  	@pins = Pin.order('created_at DESC')
  	@pinsLikes = Pin.order('like_count DESC')
  	if user_signed_in?
  		@likedPins = User.find(current_user.id).likes;
  	end
  end
  
end

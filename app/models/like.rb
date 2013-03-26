class Like < ActiveRecord::Base
  attr_accessible :pinId, :userId
  
  # Associations
  belongs_to :user
end

class Like < ActiveRecord::Base
  attr_accessible :pin_id, :user_id
  
  # Associations
  belongs_to :user
  has_one :pin

end

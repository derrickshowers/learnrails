class Pin < ActiveRecord::Base
  attr_accessible :description, :image
  
  # Validation
  validates :description, presence: true
  validates :user_id, presence: true
  validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
  														 size: {less_than: 5.megabytes }
  														 
  # Associations
  has_attached_file :image
  belongs_to :user
end

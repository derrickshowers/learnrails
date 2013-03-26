class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :likedPins
  # attr_accessible :title, :body
  
  has_many :pins
  has_many :likes
  
  def fname
    self.name.split(/\s+/, 1+1)[0...1].join(' ')
  end
  
end

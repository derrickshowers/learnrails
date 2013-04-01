class AddRatingsToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :ratings, :integer
  end
end

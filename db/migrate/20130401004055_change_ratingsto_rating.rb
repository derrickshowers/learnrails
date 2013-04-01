class ChangeRatingstoRating < ActiveRecord::Migration
  def up
  	rename_column :likes, :ratings, :rating
  end

  def down
  end
end

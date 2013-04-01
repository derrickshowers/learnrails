class ChangeLikestoLikeCount < ActiveRecord::Migration
  def up
  	rename_column :pins, :likes, :likeCount
  end

  def down
  end
end

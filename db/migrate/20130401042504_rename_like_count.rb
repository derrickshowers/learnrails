class RenameLikeCount < ActiveRecord::Migration
  def up
  	rename_column :pins, :likeCount, :like_count
  end

  def down
  end
end

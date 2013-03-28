class RenameColumn < ActiveRecord::Migration
  def up
  	rename_column :likes, :userId, :user_id
  end

  def down
  end
end

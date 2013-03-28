class RenamePinIdColumn < ActiveRecord::Migration
  def up
  	rename_column :likes, :pinId, :pin_id
  end

  def down
  end
end

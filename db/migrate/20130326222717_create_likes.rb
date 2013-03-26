class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :userId
      t.integer :pinId

      t.timestamps
    end
  end
end

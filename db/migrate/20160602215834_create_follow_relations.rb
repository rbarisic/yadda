class CreateFollowRelations < ActiveRecord::Migration
  def change
    create_table :follow_relations do |t|
      t.integer :follower
      t.integer :following

      t.timestamps null: false
    end
  end
end

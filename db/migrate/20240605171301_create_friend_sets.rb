class CreateFriendSets < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_sets do |t|
      t.references :team, null: false, foreign_key: true
      t.string :name
      t.float :multiplier

      t.timestamps
    end
  end
end

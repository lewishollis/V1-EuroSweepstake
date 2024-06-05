class CreateFriendTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_teams do |t|
      t.references :friend, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.integer :points, default: 0
      t.float :multiplier, default: 1.0

      t.timestamps
    end
  end
end

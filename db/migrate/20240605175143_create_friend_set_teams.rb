class CreateFriendSetTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_set_teams do |t|
      t.references :friend_set, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end

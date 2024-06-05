class CreateTeamSetTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :team_set_teams do |t|
      t.references :team_set, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end

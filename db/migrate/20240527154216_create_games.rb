# db/migrate/XXXXXX_create_games.rb
class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :team1, null: false, foreign_key: { to_table: :teams }
      t.references :team2, null: false, foreign_key: { to_table: :teams }
      t.integer :team1_score
      t.integer :team2_score
      t.datetime :game_date
      t.string :stage

      t.timestamps
    end
  end
end

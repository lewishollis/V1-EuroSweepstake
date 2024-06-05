class CreateTeamSets < ActiveRecord::Migration[7.0]
  def change
    create_table :team_sets do |t|
      t.string :name
      t.decimal :multiplier
      t.references :friend, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class AddDefaultPointsToTeams < ActiveRecord::Migration[7.0]
  def change
    change_column_default :teams, :points, 0
  end
end

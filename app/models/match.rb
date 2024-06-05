# app/models/match.rb
class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  # Add attributes for home_points and away_points
  attribute :home_points, :integer
  attribute :away_points, :integer
  attribute :accessible_event_summary, :string
end

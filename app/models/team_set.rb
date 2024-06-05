# app/models/team_set.rb
class TeamSet < ApplicationRecord
  belongs_to :friend_set
  belongs_to :team
end

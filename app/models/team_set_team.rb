class TeamSetTeam < ApplicationRecord
  belongs_to :team_set
  belongs_to :team
end

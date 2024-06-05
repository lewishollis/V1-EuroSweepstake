# app/models/friend_set_team.rb
class FriendSetTeam < ApplicationRecord
  belongs_to :friend_set
  belongs_to :team
end

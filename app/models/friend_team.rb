# app/models/friend_team.rb
class FriendTeam < ApplicationRecord
  belongs_to :friend
  belongs_to :team
end

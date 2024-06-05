# app/models/friend_set.rb
class FriendSet < ApplicationRecord
  belongs_to :friend
  has_many :teams, through: :team_sets  # Update the association to reflect the correct through association
end

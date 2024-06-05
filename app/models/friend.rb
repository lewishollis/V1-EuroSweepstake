class Friend < ApplicationRecord
  has_many :friend_sets
  has_many :team_sets, through: :friend_sets

  def total_score
    team_sets.sum(:points)
  end
end

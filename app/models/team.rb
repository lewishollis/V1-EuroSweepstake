class Team < ApplicationRecord
  has_many :friend_teams
  has_many :matches

  # Ensure points are always initialized
  after_initialize :set_default_points, if: :new_record?

  private

  def set_default_points
    self.points ||= 0
  end
end

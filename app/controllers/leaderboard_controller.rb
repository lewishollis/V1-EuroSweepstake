# app/controllers/leaderboard_controller.rb
class LeaderboardController < ApplicationController
  def index
    @friends = Friend.includes(friend_sets: [:team]).all

    @leaderboard = @friends.map do |friend|
      total_score = if friend.friend_sets.present?
                      friend.friend_sets.sum do |friend_set|
                        friend_set.team.matches_as_team1.sum { |match| match.team1_score * friend_set.multiplier }
                      end
                    else
                      0
                    end
      [friend.name, total_score]
    end
  end
end

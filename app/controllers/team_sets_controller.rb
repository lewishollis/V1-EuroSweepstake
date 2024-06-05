class TeamSetsController < ApplicationController
  def index
    @team_sets = TeamSet.includes(:friend, :teams).all
  end
end

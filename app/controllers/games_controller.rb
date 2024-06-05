# app/controllers/games_controller.rb
class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
  @game = Game.new(game_params)
  if @game.save
    redirect_to games_path, notice: 'Game was successfully created.'
  else
    render :new
  end
end


  private

  def game_params
    params.require(:game).permit(:team1_id, :team2_id, :team1_score, :team2_score, :game_date, :stage)
  end
end

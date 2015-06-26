class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game),  notice: "Your new game was successfully created."
    else
      flash.alert = "Please fix the errors below to continue."
      render :new
    end
  end

  def show
    @game = Game.find_by_id(params[:id])
  end

  def index
    @games = Game.all
  end

  def initialize_game
    if params[:id].present?
      @game = Game.find(params[:id])
    else
      @game = Game.new
    end
    if params[:game].present?
      @game.assign_attributes(game_params)
    end
  end

  def game_params
    params.require(:game).permit(:date)
  end

end

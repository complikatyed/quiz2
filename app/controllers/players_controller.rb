class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to player_path,  notice: "The player has been saved."
    else
      flash.alert = "Please fix the errors below to continue."
      render :new
    end
  end


  def show
    @player = Player.find_by_id(params[:id])
  end


  def index
    @players = Player.all
  end


    protected


  def player_params
    params.require(:player).permit(:first_name, :last_name, :email, :cell)
  end

end
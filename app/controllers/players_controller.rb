class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to player_path(@player),  notice: "Player information was successfully saved."
    else
      flash.alert = "Please fix the errors below to continue."
      render :new
    end
  end

  def update
    if @player.save
      flash.notice = "#{@player.first_name} was updated successfully"
      redirect_to players_path
    else
      flash.alert = "Please fix the errors below to continue."
      render :edit
    end
  end


  def show
    @player = Player.find_by_id(params[:id])
  end


  def index
    @players = Player.all
  end

  def destroy
    @player = Player.find_by_id(params[:id])
    if @player.present?
      @player.destroy
  end
    redirect_to players_path, notice: "#{@player.first_name} has been removed."
  end

    protected


  def player_params
    params.require(:player).permit(:first_name, :last_name, :email, :cell)
  end



end
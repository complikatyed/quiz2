class PlayersController < ApplicationController

  def index
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to player_path(@player),  notice: "Your player profile has been saved."
    else
      flash.alert = "Please fix the errors below to continue."
      render :new
    end
  end

  def update
    @user = current_user
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to user_posts_path(@user)
      flash.notice = "Your profile has been updated"
    else
      flash.alert = "Please fix the errors below to continue"
      render :edit
    end
  end

  def show
    @player = Player.find_by_id(params[:id])
  end

    protected

  def player_params
    params.require(:player).permit(:first_name, :last_name, :email, :cell)
  end

  def destroy
    logout
    redirect_to root_path
  end

end
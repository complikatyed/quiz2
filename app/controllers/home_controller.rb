class HomeController < ApplicationController
  before_action :load_user, except: [:index, :edit, :update]
  before_action :require_login, except: [:index, :show]

  def check_auth
    unless logged_in?
      redirect_to root_path
    end
  end

  def index
  end

  def action
  end

end
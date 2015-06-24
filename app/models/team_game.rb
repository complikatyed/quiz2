class TeamGame < ActiveRecord::Base
  has_many :team_player_games
  has_many :players, through: :team_player_games

end

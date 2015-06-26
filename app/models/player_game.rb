class PlayerGame < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  validates :player_id, :game_id, presence: true

end

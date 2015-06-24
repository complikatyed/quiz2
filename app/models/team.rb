class Team < ActiveRecord::Base
  has_many :player_teams
  has_many :players, through: :player_teams

  validates :name, presence: true
  validates :name, length: { minimum: 2 }
end
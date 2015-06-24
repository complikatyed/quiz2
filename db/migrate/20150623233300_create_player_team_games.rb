class CreatePlayerTeamGames < ActiveRecord::Migration
  def change
    create_table :player_team_games do |t|
      t.references :player, index: true, foreign_key: true
      t.references :team_game, index: true, foreign_key: true
      t.integer :points
      t.integer :negs
      t.boolean :captain

      t.timestamps null: false
    end
  end
end

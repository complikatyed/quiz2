class CreatePlayerGames < ActiveRecord::Migration
  def change
    create_table :player_games do |t|
      t.references :player, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

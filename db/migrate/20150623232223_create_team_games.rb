class CreateTeamGames < ActiveRecord::Migration
  def change
    create_table :team_games do |t|
      t.integer :team_score
      t.integer :opponent_score
      t.boolean :win
      t.datetime :date_played

      t.timestamps null: false
    end
  end
end

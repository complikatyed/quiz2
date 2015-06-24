class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :date_played

      t.timestamps null: false
    end
  end
end

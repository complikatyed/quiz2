class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :cell
      t.integer :points, :default => 0
      t.integer :negs, :default => 0

      t.timestamps null: false
    end
  end
end

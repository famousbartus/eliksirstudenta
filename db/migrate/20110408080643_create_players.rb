class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :first_name, :null => false
      t.string :surename, :null => false
      t.string :email, :null => false
      t.integer :team_id, :null => false
      t.timestamps
    end

    add_index :players, :team_id
  end

  def self.down
    drop_table :players
  end
end

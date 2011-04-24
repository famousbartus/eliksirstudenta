class AddVerifiedToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :verified, :boolean, :default => false
  end

  def self.down
    remove_column :players, :verified
  end
end

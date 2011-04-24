class AddSaltAndHashToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :salt, :string
  end

  def self.down
    remove_column :players, :salt
  end
end

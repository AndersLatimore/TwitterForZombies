class AddNameToZombie < ActiveRecord::Migration
  def change
    add_column :zombies, :name, :string
  end
end

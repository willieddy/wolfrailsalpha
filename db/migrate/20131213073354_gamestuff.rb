class Gamestuff < ActiveRecord::Migration
  def change
  	add_column :users, :lat, :float
  	add_column :users, :long, :float
  	add_column :users, :dead, :boolean, default: false
  	add_column :users, :werewolf, :boolean, default: false
  	add_column :users, :vote, :integer, default: 0
  end
end

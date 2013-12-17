class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.boolean :night, default: false
    	t.boolean :active, default: true
    	t.integer :num_alive
    	t.integer :num_were
    	t.integer :num_town

        t.timestamps
    end
  end
end

class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.text :gamename
      t.text :console_format
  		t.text :developer
  		t.text :publisher
  		t.boolean :authentic
  		t.text :releasedate
  		t.text :condition
      t.integer :user_id

      t.timestamps null: false
  	end
  end
end

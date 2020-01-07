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
  	end
  end
end

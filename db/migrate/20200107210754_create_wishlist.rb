class CreateWishlist < ActiveRecord::Migration
  def change
  	create_table :wishlist do |t|
  		t.text :gamename
  		t.text :console_format
  		t.integer :user_id

  		t.timestamps null: false
  	end
  end
end

class CreateWishlist < ActiveRecord::Migration[4.2]
  def change
  	create_table :wishlists do |t|
  		t.text :gamename
  		t.text :console_format
  		t.integer :user_id

  		t.timestamps null: false
  	end
  end
end

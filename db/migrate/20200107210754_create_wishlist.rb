class CreateWishlist < ActiveRecord::Migration
  def change
  	create_table :wishlist do |t|
  		t.text :gamename
  		t.text :console_format
  end
end

class CreateGuesses < ActiveRecord::Migration
  def change
  	 create_table :guesses do |t|
  		t.integer :correct, default: 0
  		t.integer :card_id, null: false

  		t.timestamps(null: false)
  	end
  end
end

class CreateRides < ActiveRecord::Migration
	create_table :rides do |t|
		t.belongs_to :attraction
		t.belongs_to :user
	end
end

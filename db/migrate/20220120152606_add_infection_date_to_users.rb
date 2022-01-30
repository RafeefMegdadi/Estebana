class AddInfectionDateToUsers < ActiveRecord::Migration[6.1]
 def change
  	add_column :users, :infection_date, :datetime, null: false, default: DateTime.now
 end
end

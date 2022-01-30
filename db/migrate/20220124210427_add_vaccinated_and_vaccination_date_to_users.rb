class AddVaccinatedAndVaccinationDateToUsers < ActiveRecord::Migration[6.1]
  def change
  	add_column :users, :vaccinated, :boolean, null: false, default: "1"
  	add_column :users, :vaccination_date, :datetime, default: DateTime.now
  end
end

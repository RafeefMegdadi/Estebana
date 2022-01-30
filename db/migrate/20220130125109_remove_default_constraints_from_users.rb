class RemoveDefaultConstraintsFromUsers < ActiveRecord::Migration[6.1]
  def change
  	change_column_default(:users, :name, nil)
	change_column_default(:users, :gender, nil)
	change_column_default(:users, :date_of_birth, nil)
	change_column_default(:users, :phone_number, nil)
	change_column_default(:users, :address, nil)
	change_column_default(:users, :medical_state, 50)
	change_column_default(:users, :infection_date, nil)
	change_column_default(:users, :vaccinated, nil)
	change_column_default(:users, :vaccination_date, nil)
  end
end

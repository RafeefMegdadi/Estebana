class AddUserDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
  	add_column :users, :name, :string, null: false, default: "Anonymous"
  	add_column :users, :gender, :integer, null: false, default: 0
  	add_column :users, :phone_number, :string, null: false, default: "0"
  	add_column :users, :date_of_birth, :datetime, null: false, default: DateTime.now
  	add_column :users, :address, :text, null: false, default: "0"
  	add_column :users, :medical_state, :integer, null: false, default: 0
  end
end

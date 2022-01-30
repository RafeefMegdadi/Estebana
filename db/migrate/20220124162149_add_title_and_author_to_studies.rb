class AddTitleAndAuthorToStudies < ActiveRecord::Migration[6.1]
  def change
  	add_column :studies, :title, :string, null: false, default: ""
  	add_column :studies, :author, :string, default: ""
  end
end

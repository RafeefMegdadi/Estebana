class AddSubjectToQuestions < ActiveRecord::Migration[6.1]
  def change
  	add_column :questions, :subject, :string, null: false, default: ""
  end
end

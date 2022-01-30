class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.belongs_to :user, index: true, foreign_key: true

      t.text :content
      t.boolean :is_faq
      t.boolean :is_private

      t.timestamps
    end
  end
end

class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|

      t.belongs_to :user, index: true, foreign_key: true
      
      t.integer :fever_chills
      t.integer :cough
      t.integer :difficulty_breathing
      t.integer :fatigue
      t.integer :body_ache
      t.integer :headache
      t.integer :sensory_loss
      t.integer :sore_throat
      t.integer :nausea
      t.integer :diarrhea
      t.text :comment

      t.timestamps
    end
  end
end

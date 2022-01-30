class Survey < ApplicationRecord
	belongs_to :user
	validates :fever_chills, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
	validates :cough, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
	validates :difficulty_breathing, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
	validates :fatigue, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
	validates :body_ache, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
	validates :headache, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
	validates :sensory_loss, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
	validates :sore_throat, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
	validates :nausea, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
	validates :diarrhea, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
end

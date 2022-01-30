class Question < ApplicationRecord
	belongs_to :user
	has_many :answers, dependent: :destroy

	validates :subject, length: {  allow_nil: false, :allow_blank => false, message: "can't be empty" }
	validates :content, length: {  allow_nil: false, :allow_blank => false, message: "can't be empty" }

end

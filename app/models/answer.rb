class Answer < ApplicationRecord
	belongs_to :user
	belongs_to :question

	validates :content, length: {  allow_nil: false, :allow_blank => false, message: "can't be empty" }
end

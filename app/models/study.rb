class Study < ApplicationRecord
	validates :title, length: {  allow_nil: false, :allow_blank => false, message: "can't be empty" }
	validates :author, length: {  allow_nil: false, :allow_blank => false, message: "can't be empty" }
	validates :content, length: {  allow_nil: false, :allow_blank => false, message: "can't be empty" }
end

class FaqController < ApplicationController
	def index
		@faqs = []
    	Question.all.each do |question|
      	if question.is_faq and not question.is_private
        	@faqs.append(question)
      	end
      end
	end
end

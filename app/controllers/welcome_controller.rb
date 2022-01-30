class WelcomeController < ApplicationController	
	def index
		@faqs = []
		counter = 0
  	Question.all.each do |question|
  		if question.is_faq and not question.is_private and counter < 3
    		@faqs.append(question)
    		counter += 1
  		end
    end

  	@studies = []
  	counter1 = 0
    Study.all.each do |study|
  		if counter1 < 3
    		@studies.append(study)
    		counter1 += 1
  		end
  	end

    if current_user
      @last_survey = Survey.where(user_id: current_user.id).last
      if @last_survey and ((Time.now - @last_survey.created_at) / (60*60)) < 12
        @can_do_new_survey = false
        @when_is_new_survey = @last_survey.created_at + 12.hours
      else
        @can_do_new_survey = true
      end
    end
	end
end

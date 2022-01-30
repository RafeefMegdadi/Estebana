class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
  	@profile = current_user
    @users = []    
  	@survey = []
  	counter = 0
    @last_filled_survey = Survey.where(user_id: current_user.id).last
    @is_time_for_new_survey = false
    if @last_filled_survey and (Time.now - @last_filled_survey.created_at) / (60*60) < 12
      @is_time_for_new_survey = false
    else
      @is_time_for_new_survey = true
    end
  	Survey.all.reverse.each do |survey|
      	if (survey.user_id == current_user.id) and counter < 4
          counter += 1
        	@survey.append(survey)
      	end
    end

    User.order(:medical_state).all.each do |user|
      if user.role == 0
        @users.append(user)
      end
    end
  end
end
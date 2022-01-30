class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :surveys, dependent: :destroy

  validates :phone_number, length: {minimum: 10, maximum: 10}, allow_blank: false
  validates :date_of_birth, length: {  allow_nil: false, :allow_blank => false, message: "can't be empty" }
  validates :vaccinated, length: {  allow_nil: false, :allow_blank => false, message: "can't be empty" }
  validates :infection_date, length: {  allow_nil: false, :allow_blank => false, message: "can't be empty" }

  def calculate_medical_state()
    user_id = self.id
    user_age = ((Time.now - self.date_of_birth) / 1.year.seconds).floor
    user_vac_dif = Time.now
    if self.vaccinated == true and self.vaccination_date
      user_vac_dif = ((Time.now - self.vaccination_date) / 1.day.seconds).floor
    end
    user_infection_dif = ((Time.now - self.infection_date) / 1.day.seconds).floor

    #Age calculation
    age_points = 10
    if user_age > 65
      age_points = 0
    elsif user_age > 45
      age_points = 5
    else
      age_points = 10
    end 

    #Vaccination calculation
    vaccinated_points = 15
    if self.vaccinated == false or not self.vaccination_date
      vaccinated_points = 0
    elsif user_vac_dif < 21
      vaccinated_points = 7
    end

    #Infection Date calculation
    infection_points = 10
    if user_infection_dif < 5
      infection_points = 0
    elsif user_infection_dif < 10
      infection_points = 5
    end

    #current_survey calculation
    current_survey_points = 0
    last_survey = Survey.where(user_id: self.id).last
    current_survey_points += last_survey.fever_chills
    current_survey_points += last_survey.cough
    current_survey_points += last_survey.difficulty_breathing
    current_survey_points += last_survey.fatigue
    current_survey_points += last_survey.body_ache
    current_survey_points += last_survey.headache
    current_survey_points += last_survey.sensory_loss
    current_survey_points += last_survey.sore_throat
    current_survey_points += last_survey.nausea
    current_survey_points += last_survey.diarrhea

    #previous survey calculation
    previous_medical_points = 15
    if self.medical_state
      previous_medical_points = (self.medical_state / 100.0) * 15.0
    else
      previous_medical_points = 15
    end

    return previous_medical_points + current_survey_points + infection_points + vaccinated_points + age_points
  end


# Total points = 100
# Points related Age = 10
# Points related to Vaccination = 15
# Points related infection date = 10
# Points related current survey = 50
# Points related previous survey = 15

# In Case no previous survey we give 15


# @survey.attributes.each do |attribute| 
#   attribute.keys.each do |key| 
#     if key > 3 
#      counter += 1
#     elsif key == 3 
#      counter += .5
#     else
#      counter += .2 
#     end 
#   end 
# end 


#    return medical_state = 0
#  end
#>3  counter+=1 
      
#    [fever_chills ,cough, difficulty_breathing, fatigue, body_ache, headache, sensory_loss, sore_throat, nausea, diarrhea]

# 5  8 10

# survey  1 2  < 3 <   4 5
# last medical_state 
# 4 5 = 10
# 3 = 5
# 1 2 = 2
# age > 65 10
# age > 45 5
# vaccinated -10 
# now-infection_date <5 10 
# >5 = 5
# vacDif<1 = 5

# infection date 
# vaccinated 
# vaccination date
# 1 monthes

end

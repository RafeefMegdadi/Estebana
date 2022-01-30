json.extract! survey, :id, :fever_chills, :cough, :difficulty_breathing, :fatigue, :body_ache, :headache, :sensory_loss, :sore_throat, :nausea, :diarrhea, :comment, :created_at, :updated_at
json.url survey_url(survey, format: :json)

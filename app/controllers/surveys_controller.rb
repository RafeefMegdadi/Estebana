class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show edit update destroy ]

  # GET /surveys or /surveys.json
  def index
    @surveys = []

    #needs to be fixed to only send surveys that belongs to a one patient at a time
    Survey.all.each do |survey|
      if survey.user_id 
        @surveys.append(survey)
      end
    end

  end

  # GET /surveys/1 or /surveys/1.json
  def show

  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
    if !(current_user and current_user.role == 2)
      redirect_to survey_url(@survey), notice: "You don't have access to edit this survey."
    end
  end

  # POST /surveys or /surveys.json
  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        current_user.medical_state = current_user.calculate_medical_state()
        current_user.save
        format.html { redirect_to survey_url(@survey), notice: "Survey was successfully created." }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1 or /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to survey_url(@survey), notice: "Survey was successfully updated." }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1 or /surveys/1.json
  def destroy
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url, notice: "Survey was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:user_id, :fever_chills, :cough, :difficulty_breathing, :fatigue, :body_ache, :headache, :sensory_loss, :sore_throat, :nausea, :diarrhea, :comment)
    end
end

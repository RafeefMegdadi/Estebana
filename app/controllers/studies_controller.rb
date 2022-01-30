class StudiesController < ApplicationController
  before_action :set_study, only: %i[ show edit update destroy ]

  # GET /studies or /studies.json
  def index
    @studies = Study.all
  end

  # GET /studies/1 or /studies/1.json
  def show
  end

  # GET /studies/new
  def new
    if !(current_user and current_user.role != 0)
      redirect_to studies_url(), notice: "You don't have access to add a new study."
    else
      @study = Study.new
    end
  end

  # GET /studies/1/edit
  def edit
    if !(current_user and current_user.role != 0)
      redirect_to studies_url(), notice: "You don't have access to edit this study."
    end
  end

  # POST /studies or /studies.json
  def create
    @study = Study.new(study_params)

    respond_to do |format|
      if @study.save
        format.html { redirect_to study_url(@study), notice: "Study was successfully created." }
        format.json { render :show, status: :created, location: @study }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studies/1 or /studies/1.json
  def update
    respond_to do |format|
      if @study.update(study_params)
        format.html { redirect_to studies_url(@studies), notice: "Study was successfully updated." }
        format.json { render :show, status: :ok, location: @study }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studies/1 or /studies/1.json
  def destroy
    if (current_user and current_user.role == 0) or not current_user
     return 
    else
      @study.destroy

      respond_to do |format|
        format.html { redirect_to studies_url, notice: "Study was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study
      @study = Study.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def study_params
      params.require(:study).permit(:study_id ,:content, :author, :title)
    end
end

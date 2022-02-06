class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy ]

  # GET /answers or /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1 or /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    if !(current_user and current_user.role != 0)
      redirect_to question_url(@answer.question_id), notice: "You don't have access to create an answer."
    else
      @answer = Answer.new
    end
  end

  # GET /answers/1/edit
  def edit

    if !(current_user and (current_user.id == @answer.user_id or current_user.role == 2))
      redirect_to question_url(@answer.question_id), notice: "You don't have access to edit this answer."
    end
  end

  # POST /answers or /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_url(@answer.question_id), notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { redirect_to question_url(@answer.question_id), notice: "Answer couldn't be created"  }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to question_url(@answer.question_id), notice: "Answer was successfully updated." }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    if !(current_user and (current_user.id == @answer.user_id or current_user.role == 2))
     return 
    else
      @answer.destroy

      respond_to do |format|
        format.html { redirect_to questions_url, notice: "Answer was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:content, :question_id, :user_id)
    end
end

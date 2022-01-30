class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = []
    @questions2 = []

    Question.all.each do |question|
      if question.user_id == current_user.id or question.is_private == false
        @questions.append(question)
      else   
        @questions2.append(question)
      end
    end
  end

  # GET /questions/1 or /questions/1.json
  def show
    @answer = Answer.new
    
    @answers = []
    Answer.all.each do |answer|
      if answer.question_id == @question.id
        @answers.append(answer)
      end
    end
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit

  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)#

    respond_to do |format|
      if @question.save
        format.html { redirect_to question_url(@question), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    if !(current_user and (current_user.id == @question.user_id or current_user.role != 0))
     return 
    else
      @question.destroy

      respond_to do |format|
        format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:content, :is_faq, :is_private, :user_id, :subject)
    end
end

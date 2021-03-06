class Admin::AnswersController < Admin::BaseController

  before_action :set_answer, only: %i[show edit update destroy]
  before_action :set_question, only: %i[new create]

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to admin_answer_path(@answer), flash: { success: 'Answer created.' }
    else
      flash[:danger] = 'Answer not created!'
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer), flash: { primary: 'Answer updated.' }
    else
      flash[:danger] = 'Answer not updated!'
      render :edit
    end
  end

  def destroy
    @answer.destroy

    redirect_to admin_question_path(@answer.question), flash: { danger: 'Answer deleted.' }
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end

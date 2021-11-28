class Admin::QuestionsController < Admin::BaseController

  before_action :set_test, only: %i[new create]
  before_action :set_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show

  end

  def new
    @question = @test.questions.new
  end

  def edit
    
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_question_path(@question), flash: { success: 'Question created!' }
    else
      redirect_to admin_tests_path, flash: { danger: 'Question not created!' }
    end
  end

  def update
    
    if @question.update(question_params)
      redirect_to admin_question_path(@question), flash: { primary: 'Question updated!' }
    else
      redirect_to admin_question_path(@question), flash: { danger: 'Question updating failed!' }
    end 
  end

  def destroy
    @question.destroy

    redirect_to admin_test_path(@question.test), flash: { danger: 'Question deleted.' }
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found!'
  end

end

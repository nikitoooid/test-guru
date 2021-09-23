class QuestionsController < ApplicationController

  before_action :find_test
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: "Questions:\n#{@test.questions.pluck(:body).join("\n")}"
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      render plain: 'Question successfully saved.'
    else
      render plain: 'Question creation failed!'
    end
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found!'
  end

end

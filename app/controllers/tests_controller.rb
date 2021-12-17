class TestsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_test, only: %i[start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.ready_to_pass
  end

  def start
    if(@test.questions.any?)
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      redirect_to tests_path, flash: { danger: 'There are no questions in this test.' }
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test not found!'
  end
end

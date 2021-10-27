class TestsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_test, only: %i[show start]
  before_action :set_user, only: %i[start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show

  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def rescue_with_test_not_found
    render plain: 'Test not found!'
  end
end

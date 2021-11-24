class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = current_user.created_tests.new
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      redirect_to admin_tests_path, alert: t('.fail')
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: "Test #{@test.title} updated!"
    else
      redirect_to admin_test_path(@test), alert: t('.fail')
    end 
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path, notice: t('.success')
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test not found!'
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end

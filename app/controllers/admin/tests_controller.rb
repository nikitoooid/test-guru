class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update destroy update_inline] 

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
      redirect_to admin_test_path(@test), flash: { success: t('.success') }
    else
      redirect_to admin_tests_path, flash: { danger: t('.fail') }
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), flash: { primary: "Test #{@test.title} updated!" }
    else
      redirect_to admin_test_path(@test), flash: { danger: t('.fail') }
    end 
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path, flash: { danger: t('.success') }
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end

  def rescue_with_test_not_found
    render plain: 'Test not found!'
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end

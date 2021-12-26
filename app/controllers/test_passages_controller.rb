class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist stop_passing]
  before_action :set_timer, only: %i[show update]

  def show
    
  end

  def result
    @received_badges = BadgeService.new(@test_passage).call
  end

  def gist
    new_gist = GistQuestionService.new(@test_passage.current_question)
    result = new_gist.call

    if new_gist.success?
      flash_options = { notice: t('.success', url: result.html_url) }
      current_user.gists.create(question: @test_passage.current_question, url: result.html_url )
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  def update
    params[:answer_ids].nil? ? flash.now[:danger] = t('.no_answer') :  @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def stop_passing
    redirect_to result_test_passage_path(@test_passage), flash: {danger: t('time_over')}
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def set_timer
    @timer = @test_passage.test.timer * 60
    @time_left = @timer == 0 ? 0 : @timer - (Time.now - @test_passage.created_at.to_time)
  end
end

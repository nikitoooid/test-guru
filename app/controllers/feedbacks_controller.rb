class FeedbacksController < ApplicationController

  def new
  end

  def create
    @feedback = feedback_params
    if @feedback
      @feedback[:user] = current_user.email

      FeedbacksMailer.feedback(@feedback).deliver_now
      redirect_to root_path, notice: t('success_dispatch')
    else
      render new_feedback_path, alert: t('failure_dispatch')
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end

end

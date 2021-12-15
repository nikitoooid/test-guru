class FeedbacksController < ApplicationController

  def new
  end

  def create
    if feedback_params
      FeedbacksMailer.send_feedback(from: current_user.email,
                                    title: feedback_params[:title],
                                    body: feedback_params[:body]).deliver_now
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

class FeedbacksMailer < ApplicationMailer
  
  def feedback(feedback)
    @title = feedback[:title]
    @body = feedback[:body]
    @user = feedback[:user]

    mail to: ENV['FEEDBACK_TO'], subject: "New feedback: #{@title}"
  end

end

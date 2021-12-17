class FeedbacksMailer < ApplicationMailer
  
  def send_feedback(title:, body:, from:)
    mail to: ENV['FEEDBACK_TO'], subject: "New feedback: #{@title}"
  end

end

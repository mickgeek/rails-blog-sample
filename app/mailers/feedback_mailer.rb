class FeedbackMailer < ApplicationMailer
  def feedback_email(feedback)
    @feedback = feedback
    mail(to: ADMIN_EMAIL, subject: "[Feedback form] #{@feedback.subject}",
      reply_to: ["#{@feedback.name} <#{@feedback.email}>"])
  end
end

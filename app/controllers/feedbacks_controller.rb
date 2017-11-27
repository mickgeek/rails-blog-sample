class FeedbacksController < ApplicationController
  # GET /feedback/new
  def new
    @feedback = Feedback.new
  end

  # POST /feedback
  def create
    feedback_params = params.require(:feedback).permit(:name, :email, :subject, :message)
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      begin
        FeedbackMailer.feedback_email(@feedback).deliver_now
        redirect_to new_feedback_path, notice: "Thank you for your message. We will be in touch shortly."
      rescue StandardError => e
        redirect_to new_feedback_path, alert: "We couldn't send your message. Please try again later."
      end
    else
      render :new
    end
  end
end

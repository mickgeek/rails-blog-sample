class Feedback
  include ActiveModel::Model

  attr_accessor :name, :email, :subject, :message

  validates :name, :email, :subject, :message, presence: true
  validates :name, :subject, length: { maximum: 100 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "is not an email" }
end

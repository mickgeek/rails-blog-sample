class User < ApplicationRecord
  has_many :posts

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  def minimum_password_length
    if Devise.mappings[:user].validatable?
      Devise.password_length.min
    end
  end
end

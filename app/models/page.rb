class Page < ApplicationRecord
  validates :title, :url, :body, presence: true
  validates :title, length: { maximum: 150 }

  default_scope { order(created_at: :desc) }
end

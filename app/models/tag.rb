class Tag < ApplicationRecord
  extend FriendlyId

  has_many :post_tags
  has_many :posts, through: :post_tags

  validates :name, presence: true
  validates :name, length: { maximum: 50 }

  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    !slug || name_changed?
  end
end

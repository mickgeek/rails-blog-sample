class Post < ApplicationRecord
  extend FriendlyId

  STATUS_DRAFT = 1
  STATUS_PUBLISHED = 2
  STATUS_ARCHIVED = 3

  attr_accessor :new_tag_ids

  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  before_save :set_published_date
  after_save :update_tags

  validates :title, :body, :snippet, :status, presence: true
  validates :title, length: { maximum: 150 }
  validates :status, inclusion: { in: [STATUS_DRAFT, STATUS_PUBLISHED, STATUS_ARCHIVED] }

  default_scope { order(created_at: :desc) }
  scope :active, -> { where(status: [STATUS_PUBLISHED, STATUS_ARCHIVED]) }
  scope :published, -> { where(status: STATUS_PUBLISHED) }
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    !slug || title_changed?
  end

  def set_published_date
    if !self.published_date && [STATUS_PUBLISHED, STATUS_ARCHIVED].include?(status)
      self.published_date = Time.now
    end
  end

  def update_tags
    new_tag_ids = self.new_tag_ids.reject(&:empty?).map(&:to_i)
    old_tag_ids = post_tags.pluck(:tag_id).map(&:to_i)
    add_tags(new_tag_ids - old_tag_ids)
    remove_tags(old_tag_ids - new_tag_ids)
  end

  def add_tags(ids)
    if !ids.empty?
      ids.each do |id|
        post_tag = post_tags.new(tag_id: id)
        post_tag.save
      end
    end
  end

  def remove_tags(ids)
    if !ids.empty?
      ids.each do |id|
        post_tag = post_tags.where(tag_id: id).first
        post_tag.destroy
      end
    end
  end

  # Returns a list of human-readable name-value pairs (or a separate name of
  # a value) to use as choices for a field.
  def choices(name, key = nil)
    items = {}
    items[:status] = {
      "Draft" => STATUS_DRAFT,
      "Published" => STATUS_PUBLISHED,
      "Archived" => STATUS_ARCHIVED,
    }

    return key ? items[name].key(key) : items[name]
  end
end

module TagsHelper
  # Returns records of tags that use for rendering the tag menu.
  def post_tags
    statuses = [Post::STATUS_PUBLISHED, Post::STATUS_ARCHIVED]
    return Tag.includes(:posts).where(posts: { status: statuses }).order(name: :asc)
  end
end

class PostsController < ApplicationController
  layout 'application_blog'

  # GET /posts
  def index
    @posts = Post.published.page(params[:page])
  end

  # GET /posts/title
  def show
    @post = Post.friendly.find(params[:id])
  end

  # GET /posts/archive
  def archive
    posts = Post.active
    @years = {}
    posts.each do |post|
      year = post.published_date.strftime("%Y")
      @years[year] = @years.key?(year) ? @years[year].push(post) : [post]
    end
  end

  # GET /posts/tags/name
  def list_by_tag
    @posts = Post.active.includes(:tags).where(tags: { slug: params[:tag] }).page(params[:page])
    page_not_found if @posts.empty?
    @tag = Tag.find_by_slug(params[:tag])
  end
end

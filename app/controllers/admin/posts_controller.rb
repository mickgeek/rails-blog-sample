class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: [:edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.page(params[:page])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/title/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to admin_posts_path, notice: "Post was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /posts/title
  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /posts/title
  def destroy
    @post.destroy
    redirect_to admin_posts_url, notice: "Post was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body, :snippet, :status, :new_tag_ids => [])
  end
end

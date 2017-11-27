class Admin::TagsController < Admin::AdminController
  before_action :set_tag, only: [:edit, :update, :destroy]

  # GET /tags
  def index
    @tags = Tag.order(id: :desc).page(params[:page])
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/title/edit
  def edit
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path, notice: "Tag was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /tags/title
  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path, notice: "Tag was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /tags/title
  def destroy
    @tag.destroy
    redirect_to admin_tags_url, notice: "Tag was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name)
  end
end

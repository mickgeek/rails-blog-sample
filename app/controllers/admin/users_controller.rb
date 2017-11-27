class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:edit, :update, :destroy]

  # GET /users
  def index
    @users = User.page(params[:page])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "User was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if params[:user][:password].empty? && params[:user][:password_confirmation].empty?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    if @user.id != current_user.id
      @user.destroy
      redirect_to admin_users_url, notice: "User was successfully destroyed."
    else
      redirect_to admin_users_url, alert: "You cannot destroy your account."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

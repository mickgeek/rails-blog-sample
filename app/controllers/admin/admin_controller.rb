class Admin::AdminController < ActionController::Base
  layout 'admin'
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end

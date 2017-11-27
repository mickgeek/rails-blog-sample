class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def page_not_found
    raise ActionController::RoutingError, params[:path]
  end
end

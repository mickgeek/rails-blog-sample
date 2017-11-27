class PagesController < ApplicationController
  # GET /pages/url
  def show
    @page = Page.find_by_url(params[:url])
    page_not_found if !@page
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_blog

  # helper method infomation. See below URL.
  # http://apidock.com/rails/AbstractController/Helpers/ClassMethods/helper
  helper :exhibits

  def blog_url(*)
     root_url
  end

  private
  def init_blog
     @blog = THE_BLOG
  end

  def blog
     @blog ||= THE_BLOG
  end
end

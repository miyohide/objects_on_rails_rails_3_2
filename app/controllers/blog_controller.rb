# coding: utf-8
class BlogController < ApplicationController
   def index
      if params[:tag].present?
         @blog = blog.filter_by_tag(params[:tag])
      else
         @blog = blog
      end
   end
end

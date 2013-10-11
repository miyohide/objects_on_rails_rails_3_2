# coding: utf-8
class BlogController < ApplicationController
   def index
      @blog = Blog.new
   end
end

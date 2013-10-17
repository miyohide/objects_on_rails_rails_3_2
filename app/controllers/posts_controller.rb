# coding: utf-8

class PostsController < ApplicationController
   def new
      @post = @blog.new_post
   end
end


# coding: utf-8

class PostsController < ApplicationController
   respond_to :html, :json
   include ExhibitsHelper

   def new
      @post = blog.new_post
   end

   def create
      @post = Taggable(blog.new_post(params[:post]))
      if @post.publish
         redirect_to root_path, notice: "Post added!"
      else
         render "new"
      end
   end

   def show
      @post = exhibit(blog.post(params[:id]), self)
      respond_with(@post)
   end

   private
   attr_reader :post
   helper_method :post
end


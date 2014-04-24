# coding: utf-8

require 'minitest/autorun'
require_relative '../spec_helper_full'

describe Post do
   include SpecHelpers

   before do
      setup_database
      @blog = Blog.new
   end

   after do
      teardown_database
   end

   def make_post(attrs)
      attrs[:title] ||= "Post #{attrs.hash}"
      post = @blog.new_post(attrs)
      post.publish.must_equal(true)
      post
   end

   describe ".all_tags_alphabetical" do
      before do
         @post_tags = [
            nil,
            %w(barley yeast),
            %w(yeast hops),
            %w(water)
         ]

         @post_tags.each do |tags|
            make_post(title: tags.inspect, tags: tags)
         end
         @it = Taggable(Post).all_tags_alphabetical
      end

      it "returns a unique, alphabetized list of all tags" do
         @it.must_equal TagList(%w(barley hops water yeast))
      end
   end

   describe ".tagged" do
      it "filters the collection by tag" do
         duck = make_post tags: %w[billed feathered]
         robin = make_post tags: %w[reddish feathered]
         fox = make_post tags: %w[reddish furred]
         platypus = make_post tags: %w[billed furred]

         reddish = Taggable(Post).tagged("reddish")
         reddish.size.must_equal 2
         reddish.must_include(robin)
         reddish.must_include(fox)
         furred = Taggable(Post).tagged("furred")
         furred.size.must_equal 2
         furred.must_include(fox)
         furred.must_include(platypus)
      end
   end
end


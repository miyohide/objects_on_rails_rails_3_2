# coding: utf-8

require_relative 'post'

class Blog
   attr_writer :post_source

   def initialize(entry_fetcher=Post.public_method(:all))
      @entry_fetcher = entry_fetcher
   end

   def title
      "Watching Paint Dry"
   end

   def subtitle
      "The trusted source for drying paint new & opinion"
   end

   def new_post(*args)
      post_source.call(*args).tap do |p|
         p.blog = self
      end
   end

   def add_entry(entry)
      entry.save
   end

   def entries
      fetch_entries.sort_by { |e| e.pubdate }.reverse.take(10)
   end

   private
   def post_source
      @post_source ||= Post.public_method(:new)
   end

   def fetch_entries
      @entry_fetcher.()
   end
end


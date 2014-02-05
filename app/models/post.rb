# coding: utf-8

require 'date'
require 'active_record'

class Post < ActiveRecord::Base

   attr_accessible :title, :body
   validates :title, presence: true
   after_save :broadcast_entry

   attr_accessor :blog

   def publish(clock=DateTime)
      return false unless valid?
      self.pubdate = clock.now
      blog.add_entry(self)
   end

   def picture?
      image_url.present?
   end

   private
   def broadcast_entry
      blog.spam_social_networks(self)
   end
end


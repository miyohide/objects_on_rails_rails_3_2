# coding: utf-8

require 'date'
require 'active_record'

class Post < ActiveRecord::Base
   include FigLeaf

   # hide ActiveRecord::Base, ancestors: true,
   #    except: [Object, :init_with, :new_record?,
   #             :errors, :valid?, :save, :record_timestamps, :id, :id=]
   # hide_singletons ActiveRecord::Calculations,
   #                 ActiveRecord::FinderMethods,
   #                 ActiveRecord::Relation

   attr_accessible :title, :body, :pubdate, :image_url
   validates :title, presence: true

   attr_accessor :blog

   def publish(clock=DateTime)
      return false unless valid?
      self.pubdate = clock.now
      blog.add_entry(self)
   end

   def self.most_recent(limit=10)
      all(order: "pubdate DESC", limit: limit)
   end

   def self.first_before(date)
      first(conditions: ["pubdate < ?", date],
            order: "pubdate DESC")
   end

   def self.first_after(date)
      first(conditions: ["pubdate > ?", date],
            order: "pubdate ASC")
   end

   def picture?
      image_url.present?
   end

   def prev
      self.class.first_before(pubdate)
   end

   def next
      self.class.first_after(pubdate)
   end

   def up
      blog
   end
end


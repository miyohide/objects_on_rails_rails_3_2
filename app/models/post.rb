# coding: utf-8

require 'date'
require 'active_record'

class Post < ActiveRecord::Base
   include FigLeaf

   hide ActiveRecord::Base, ancestors: true,
      except: [Object, :init_with, :new_record?,
               :errors, :valid?, :save]
   hide_singletons ActiveRecord::Calculations,
                   ActiveRecord::FinderMethods,
                   ActiveRecord::Relation

   attr_accessible :title, :body, :pubdate
   validates :title, presence: true

   attr_accessor :blog

   def publish(clock=DateTime)
      return false unless valid?
      self.pubdate = clock.now
      blog.add_entry(self)
   end

   def picture?
      image_url.present?
   end
end


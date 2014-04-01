# coding: utf-8

class TagList
   extend Forwardable

   attr_reader :tags

   def_delegators :tags, :empty?, :to_a

   def initialize(tags)
      @tags = tags.split(/\W+/)
   end

   def to_s
      ""
   end

end


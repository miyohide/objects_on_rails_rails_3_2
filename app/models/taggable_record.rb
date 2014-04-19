# coding: utf-8

require_relative 'tag_list'

module TaggableRecord
   def tags
      _tag_list
   end

   def tags=(new_tags)
      @_tag_list = TagList.new(new_tags)
   end

   def save(*, &block)
      self[:tags] = _tag_list.to_a
      super
   end

   private
   def _tag_list
      @_tag_list ||= TagList.new(self[:tags])
   end
end


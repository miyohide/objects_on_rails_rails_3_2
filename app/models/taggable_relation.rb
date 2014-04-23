# coding: utf-8

require_relative 'tag_list'

module TaggableRelation
   def all_tags_alphabetical
      all_tags.alphabetical
   end

   def all_tags
      except(:limit).map { |e| Taggable(e).tags }.reduce(TagList.new([]), &:+)
   end

   def tagged(tag)
      select { |e| Taggable(e).tags.to_a.include?(tag) }
   end
end


# coding: utf-8

require_relative 'tag_list'

module TaggableRelation
   def all_tags_alphabetical
      all_tags.alphabetical
   end

   def all_tags
      TagList(ItemTag.where(item_type: klass).includes(:tag).map(&:name))
   end

   def tagged(tag)
      select { |e| Taggable(e).tags.to_a.include?(tag) }
   end

   def new(attrs={}, &block)
      attrs = attrs.dup
      tags = attrs.delete(:tags)
      Taggable(super(attrs, &block)).tap do |item|
         item.tags = tags
      end
   end
end


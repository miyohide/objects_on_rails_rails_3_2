# coding: utf-8

requrie_relative 'exhibit'

class TagListExhibit < Exhibit
   def self.applicable_to?(object)
      object_is_any_of?(object, 'TagList')
   end
end


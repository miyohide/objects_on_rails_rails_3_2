# coding: utf-8

require_relative 'exhibit'

class BlogExhibit < Exhibit
   def filter_by_tag(*)
      exhibit(super)
   end
end


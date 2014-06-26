# coding: utf-8

require_relative 'exhibit'

class EnumerableExhibit < Exhibit
   include Enumerable

   def each(*)
      super do |e|
         yield exhibit(e)
      end
   end

end


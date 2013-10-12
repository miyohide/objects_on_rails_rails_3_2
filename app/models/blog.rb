# coding: utf-8
class Blog
   attr_reader :entries

   def initialize
      @entries = []
   end

   def title
      "Watching Paint Dry"
   end

   def subtitle
      "The trusted source for drying paint new & opinion"
   end
end


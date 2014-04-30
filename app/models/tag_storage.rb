# coding: utf-8

class TagStorage
   attr_reader :item

   def initialize(item)
      @item = item
   end

   def load
      item_tags.map(&:name)
   end

end


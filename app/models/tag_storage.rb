# coding: utf-8

class TagStorage
   attr_reader :item

   def initialize(item)
      @item = item
   end

   def load
      item_tags.map(&:name)
   end

   def item_tags
      @item_tags ||= fetch_item_tags
   end

end


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

   def fetch_item_tags
      ItemTag.where(item_type: item.class, item_id: item.id).includes(:tag)
   end

   def store(tags)
      current_tags = item_tags.map(&:name)
      new_tags = Array(tags)
      remove_tags(current_tags, new_tags)
      add_tags(current_tags, new_tags)
   end

end


# coding: utf-8

require_relative 'taggable_relation'
require_relative 'taggable_record'

module Taggable

end

module Conversions
   def Taggable(item, tag_storage=::TagStorage.new(item))
      return item if item.kind_of?(::Taggable)
      case item
      when ::Class, ::ActiveRecord::Relation
         item.extend(::TaggableRelation)
      else
         item.extend(::TaggableRecord)
         item._tag_storage = tag_storage
      end
      item
   end
end


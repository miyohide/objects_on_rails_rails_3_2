# coding: utf-8

require_relative 'taggable_relation'
require_relative 'taggable_record'

module Taggable

end

module Conversions
   def Taggable(item)
      case item
      when ::Class, ::ActiveRecord::Relation
         item.extend(::TaggableRelation)
      else
         item.extend(::TaggableRecord)
      end
      item.extend(::Taggable)
   end
end


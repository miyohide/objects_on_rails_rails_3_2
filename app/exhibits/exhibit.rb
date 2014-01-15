require 'delegate'

class Exhibit < SimpleDelegator
   def initialize(model, context)
      @context = context
      super(model)
   end

   def self.exhibit(object, context)
      exhibits.inject(object) do |object, exhibit|
         exhibit.exhibit_if_applicable(object, context)
      end
   end

   def to_model
      __getobj__
   end

   def class
      __getobj__.class
   end
end


# coding: utf-8

require_relative 'exhibit'

class EnumerableExhibit < Exhibit
   include Enumerable

   def each(*)
      super do |e|
         yield exhibit(e)
      end
   end

   exhibit_query :[], :fetch

   def self.exhibit_enum(*method_names, &post_process)
      post_process ||= ->(result){exhibit(result)}
      method_names.each do |method_name|
         define_method(method_name) do |*args, &block|
            result = __getobj__.public_send(method_name, *args, &block)
            instance_exec(result, &post_process)
         end
      end
   end
   private_class_method :exhibit_enum

   exhibit_enum :select, :grep, :reject, :to_enum, :sort, :sort_by, :reverse

end


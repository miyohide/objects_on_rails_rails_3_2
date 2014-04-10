# coding: utf-8

class TagList
   extend Forwardable

   attr_reader :tags

   def_delegators :tags, :empty?, :to_a

   def initialize(tags)
      case tags
      when Array
         @tags = tags
      else
         @tags = tags.split(/\W+/)
      end
      @tags.each(&:downcase!)
      @tags.uniq!
   end

   def to_s
      @tags.join(", ")
   end

   def +(other)
      self.class.new(to_a + other.to_a)
   end

   def ==(other)
      ## other.to_aとしないのは、otherがStringのときにto_aが落ちるため
      to_a == Array(other)
   end

   def alphabetical
      self.class.new(tags.sort)
   end
end


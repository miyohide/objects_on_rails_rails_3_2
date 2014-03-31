# coding: utf-8

require 'minitest/autorun'

require_relative '../spec_helper_lite'
require_relative '../../app/models/tag_list'

describe TagList do
   describe "given a blank string" do
      before do
         @it = TagList.new("")
      end

      it "is empty" do
         @it.must_be_empty
      end

      it "stringifies to the empty string" do
         @it.to_s.must_equal ""
      end

      it "arrayifies to the empty array" do
         @it.to_a.must_equal []
      end
   end
end


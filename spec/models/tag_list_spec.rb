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

   describe "given tags separated by commas or whitespace" do
      before do
         @it = TagList.new("barley, hops water, yeast")
      end

      it "is not empty" do
         @it.wont_be_empty
      end

      it "stringifies to a comma separated list" do
         @it.to_s.must_equal "barley, hops, water, yeast"
      end

      it "arrayifies to a list of strings" do
         @it.to_a.must_equal %w[barley hops water yeast]
      end
   end
end


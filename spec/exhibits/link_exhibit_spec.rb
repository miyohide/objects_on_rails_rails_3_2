# coding: utf-8

require 'minitest/autorun'

require_relative '../spec_helper_lite'
require_relative '../../app/exhibits/link_exhibit'
require 'ostruct'

describe LinkExhibit do
   before do
      @next = Object.new
      @prev = Object.new
      @up = Object.new
      @context = Object.new
      @model = OpenStruct.new(
         next: @next, prev: @prev, up: @up
      )

      stub(@context).url_for(@prev) { "URL_FOR_PREV" }
      stub(@context).url_for(@next) { "URL_FOR_NEXT" }
      stub(@context).url_for(@up)   { "URL_FOR_UP" }

      @it = LinkExhibit.new(@model, @context)
   end

   it "prev_url" do
      @it.prev_url.must_equal "URL_FOR_PREV"
   end

   it "next_url" do
      @it.next_url.must_equal "URL_FOR_NEXT"
   end

   it "next_up" do
      @it.next_url.must_equal "URL_FOR_NEXT"
   end
end


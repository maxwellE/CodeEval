gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "overlapping_rectangles"

describe OverlappingRectangles , "Test Overlapping Rectangles Class" do
  before do
    @or = OverlappingRectangles.new('-3,3,-1,1,1,-1,3,-3')
    @or2 = OverlappingRectangles.new('-3,3,-1,1,-2,4,2,2')
  end
 
  describe "When asked if the rectangles overlap" do
    it "should find an answer" do
      @or.do_they_overlap?.must_equal "False" 
      @or2.do_they_overlap?.must_equal "True"
    end
  end
end

gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "reverse_groups"

describe ReverseGroups do 
  before do
    @rg = ReverseGroups.new("1,2,3,4,5;2")
    @rg2 = ReverseGroups.new("1,2,3,4,5;3")
  end
  it "should correctly reverse the numbers in the provided group size" do
    @rg.reverse_groups.must_equal "2,1,4,3,5"
    @rg2.reverse_groups.must_equal "3,2,1,4,5"
  end
end

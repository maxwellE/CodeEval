gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "sum_to_zero"

describe SumToZero do
  before do
    @s20 = SumToZero.new("2,3,1,0,-4,-1")
    @s20second = SumToZero.new("0,-1,3,-2")
  end
  it "should correctly count the ways to sum to zero with the provided numbers in groups of 4" do
    @s20.find_sums.must_equal "2"
    @s20second.find_sums.must_equal "1"
  end
end
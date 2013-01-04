gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "flavius_josephus"

describe FlaviusJosephus do
  before do
    @fj = FlaviusJosephus.new("10,3")
    @fj2 = FlaviusJosephus.new("5,2")
  end
  it "should be able to find the correct order of people eliminated" do
    @fj.eliminate_order.must_equal "2 5 8 1 6 0 7 4 9 3"
    @fj2.eliminate_order.must_equal "1 3 0 4 2"
  end
end

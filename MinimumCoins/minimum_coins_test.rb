gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "minimum_coins"

describe MinimumCoins do 
  describe "Core functionality" do
    before do
      @mc = MinimumCoins.new(11)
      @mc2 = MinimumCoins.new(20)
    end
    it "should find the correct number of coins to find the given sum" do
      @mc.number_of_coins_required.must_equal 3
      @mc2.number_of_coins_required.must_equal 4
    end
  end
end

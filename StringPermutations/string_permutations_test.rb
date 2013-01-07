gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "string_permutations"

describe StringPermutations do
  before do
    @sp = StringPermutations.new("hat")
  end
  it "should find all the permutations of the string 'hat'." do
    @sp.find_permutations.must_equal "aht,ath,hat,hta,tah,tha"
  end
end

gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "decode_numbers"

describe DecodeNumbers do
  before do
    @dn = DecodeNumbers.new("12")
    @dn2 = DecodeNumbers.new("123")
  end

  it "should return the correct number of ways to decode the string" do
    @dn.number_of_decodings.must_equal 2
    @dn2.number_of_decodings.must_equal 3
  end
end

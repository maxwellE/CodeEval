gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "string_substitution"

describe StringSubstitution do
  before do
    @ss = StringSubstitution.new("10011011001;0110,1001,1001,0,10,11")
  end
  it "should correctly perform substitutions on the string" do
    @ss.perform_substitutions.must_equal "11100110"
  end
end
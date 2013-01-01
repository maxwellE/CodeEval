require "test/unit"

require_relative "string_rotation"

class TestStringRotation < Test::Unit::TestCase
  def setup
    @sr = StringRotation.new('Hello,lloHe')
  end
  def test_should_find_valid_rotation
    assert(@sr.valid_rotation?, "Should of found that the strings are a valid rotation.")
  end
end
require "test/unit"

require_relative "pascals_triangle"

class TestPascalsTriangle < Test::Unit::TestCase
  def setup
    @pt = PascalsTriangle.new(6)
  end
  
  def test_should_generate_correct_triangle
    assert_equal("1 1 1 1 2 1 1 3 3 1 1 4 6 4 1 1 5 10 10 5 1", @pt.generate_triangle)
  end
end
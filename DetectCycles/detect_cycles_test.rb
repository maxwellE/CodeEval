require "test/unit"

require_relative "detect_cycles"

class TestDetectCycles < Test::Unit::TestCase
  def setup
    @dc = DetectCycles.new([2, 0, 6, 3, 1, 6, 3, 1, 6, 3, 1])
  end
  def test_should_a_cycle
    assert_equal([6,3,1], @dc.find_cycle)
  end
end
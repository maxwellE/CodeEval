require "test/unit"

require_relative "FizzBuzz"

class TestFizzBuzz < Test::Unit::TestCase
  def setup
    @fb = FizzBuzzer.new(3,5,10)
    @fb2 = FizzBuzzer.new(2,7,15)
  end
  def test_output
    assert_equal("1 2 F 4 B F 7 8 F B",@fb.create_output)
    assert_equal("1 F 3 F 5 F B F 9 F 11 F 13 FB 15",@fb2.create_output)
  end
end

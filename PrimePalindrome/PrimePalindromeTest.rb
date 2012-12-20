require "test/unit"

require_relative "PrimePalindrome"

class TestPrimePalindrome < Test::Unit::TestCase
  def setup
   @pp = PrimePalindrome.new(1000) 
  end
  def test_get_biggest_prime_palindrome
    assert_equal(929,@pp.biggest_prime_palindrome)
  end
end

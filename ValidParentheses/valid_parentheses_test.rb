require "test/unit"

require_relative "valid_parentheses"

class TestValidParentheses < Test::Unit::TestCase
  def setup
    @vp = ValidParentheses.new('()')
    @vp2 = ValidParentheses.new('([)]')
    @vp3 = ValidParentheses.new('()[]{}')
    @vp4 = ValidParentheses.new('(]')
    @vp5 = ValidParentheses.new('(((({{[]}}))))')
    @vp6 = ValidParentheses.new('(({(})))')
  end
  
  def test_valid_parens
    assert_equal("True",@vp.valid_parens?)
    assert_equal("False",@vp2.valid_parens?)
    assert_equal("True",@vp3.valid_parens?)
    assert_equal("False",@vp4.valid_parens?)
    assert_equal("True",@vp5.valid_parens?)
    assert_equal("False",@vp6.valid_parens?)
  end                   
end
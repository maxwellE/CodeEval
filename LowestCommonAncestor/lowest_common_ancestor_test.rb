require "test/unit"

require_relative "lowest_common_ancestor"

class TestLowestCommonAncestor < Test::Unit::TestCase
  def setup
    @lca = LowestCommonAncestor.new("8 52")
    @lca2 = LowestCommonAncestor.new("3 29")
  end
  def test_should_find_lca
    assert_equal(30, @lca.lowest_common_ancestor)
    assert_equal(8, @lca2.lowest_common_ancestor)
  end
end
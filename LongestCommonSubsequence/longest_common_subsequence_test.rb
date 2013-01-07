gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "longest_common_subsequence"

describe LongestCommonSubsequence do
  before do
    @lcs = LongestCommonSubsequence.new("XMJYAUZ;MZJAWXU")
  end
  it "should find the correct longest common subsequence" do
    @lcs.get_longest_common_subsequence.must_equal "MJAU"
  end
end

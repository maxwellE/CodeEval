gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "balanced_smileys"

describe BalancedSmileys do
  before do
    @bs = BalancedSmileys.new(":((")
    @bs2 = BalancedSmileys.new("i am sick today (:()")
    @bs3 = BalancedSmileys.new("(:)")
    @bs4 = BalancedSmileys.new("hacker cup: started :):)")
    @bs5 = BalancedSmileys.new(")(")
  end
  it "should find if the provided string has balanced smileys or not" do
    @bs.valid?.must_equal "NO"
    @bs2.valid?.must_equal "YES"
    @bs3.valid?.must_equal "YES"
    @bs4.valid?.must_equal "YES"
    @bs5.valid?.must_equal "NO"
  end
end

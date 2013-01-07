gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "string_list"

describe StringList do
  before do
    @sl = StringList.new("1,aa")
    @sl2 = StringList.new("2,ab")
    @sl3 = StringList.new("3,pop")
  end

  it "should find the correct string lists" do
    @sl.get_list.must_equal "a"
    @sl2.get_list.must_equal "aa,ab,ba,bb"
    @sl3.get_list.must_equal "ooo,oop,opo,opp,poo,pop,ppo,ppp"
  end
end

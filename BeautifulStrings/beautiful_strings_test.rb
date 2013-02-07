gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "beautiful_strings"

describe BeautifulStrings do
  before do
    @bs = BeautifulStrings.new("ABbCcc")
    @bs2 = BeautifulStrings.new("Good luck in the Facebook Hacker Cup this year!")
    @bs3 = BeautifulStrings.new("Ignore punctuation, please :)")
    @bs4 = BeautifulStrings.new("Sometimes test cases are hard to make up.")
    @bs5 = BeautifulStrings.new("So I just go consult Professor Dalves")
  end
  it "should correctly find the max possible beauty score" do
    @bs.beauty_score.must_equal "152"
    @bs2.beauty_score.must_equal "754"
    @bs3.beauty_score.must_equal "491"
    @bs4.beauty_score.must_equal "729"
    @bs5.beauty_score.must_equal "646"
  end
end
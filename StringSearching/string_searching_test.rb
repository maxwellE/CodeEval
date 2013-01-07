gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "string_searching"

describe StringSearching do
  before do
    @ss = StringSearching.new("Hello,ell")
    @ss2 = StringSearching.new("This is good, is")
    @ss3 = StringSearching.new("CodeEval,C*Eval")
    @ss4 = StringSearching.new("Old,Young")
    @ss5 = StringSearching.new("Stranger,tran*r")
  end
  it "should find if the two strings 'match'." do
    @ss.match?.must_equal "true"
    @ss2.match?.must_equal "true"
    @ss3.match?.must_equal "true"
    @ss4.match?.must_equal "false"
    @ss5.match?.must_equal "true"
  end
end

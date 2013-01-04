gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "uri_comparison"

describe URIComparison do
  before do
    @uricomp = URIComparison.new("http://abc.com:80/~smith/home.html;http://ABC.com/%7Esmith/home.html")
    @uricomp2 = URIComparison.new("http://cnn.com:80/path/index1.html;http://cnn.com:80/path/index2.html")
  end
  it "should find that the two urls are equivalent to one another" do
    @uricomp.are_equivalent.must_equal "True"
    @uricomp2.are_equivalent.must_equal "False"
  end
end

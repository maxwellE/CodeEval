gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "prefix_expressions"

describe PrefixExpressions do
  before do
    @pe = PrefixExpressions.new("* + 2 3 4")
  end
  it "should find the correct answer to the expression" do
    @pe.expression_result.must_equal 20
  end
end

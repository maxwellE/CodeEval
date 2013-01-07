gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "sudoku"

describe Sudoku do
  before do
    @sudoku = Sudoku.new("4;1,4,2,3,2,3,1,4,4,2,3,1,3,1,4,2")
    @sudoku2 = Sudoku.new("4;2,1,3,2,3,2,1,4,1,4,2,3,2,3,4,1")
  end
  it "should find if the provided solution is valid or not" do
    @sudoku.valid_solution?.must_equal "True"
    @sudoku2.valid_solution?.must_equal "False"
  end
end

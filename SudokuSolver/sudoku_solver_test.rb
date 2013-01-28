gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require_relative "sudoku_solver"

describe SudokuSolver do
  before do 
    @ss = SudokuSolver.new("input.txt")
  end

  it "should find the valid solution" do
    @ss.generate_output_string.must_equal File.read("output.txt")
  end
end

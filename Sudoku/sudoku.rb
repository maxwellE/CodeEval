#!/usr/bin/env ruby -wKU
class Sudoku
  def initialize(str)
    split_str = str.split(';')
    @size_n = split_str.shift.to_i
    @solution = split_str.shift.split(',').map{|x| x.to_i}
  end
  def valid_solution?
    (1..@size_n).each do |val|
      if @solution.count(val) != @size_n
        return "False"
      end
    end
    return "True"
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    sudoku = Sudoku.new(line.strip)
    puts sudoku.valid_solution?
  end
end

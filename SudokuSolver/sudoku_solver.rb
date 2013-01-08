require 'pry'
class SudokuSolver
  def initialize(fh)
    @content = File.read(fh)
    @grid = []
  end
  def generate_output_string
    parse_input
  end
  private
  def parse_input
    @content.split("\n").each do |e|
      next if e[0] == '-'
      @grid.push parse_line(e)
    end
    binding.pry
  end
  def parse_line(line)
    split_line = line.split('|').collect do |x| 
      x.split('').map do |element|
        if element == "."
          nil
        else
          element.to_i
        end
      end
    end
  end
end

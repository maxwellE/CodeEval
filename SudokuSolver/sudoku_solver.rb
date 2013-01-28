require 'pry'
class SudokuSolver
  def initialize(fh)
    @content = File.read(fh)
    @grid = []
  end
  def generate_output_string
    parse_input
    generate_possibilities
    binding.pry
  end

  private

  def generate_possibilities
    @possibilities = Marshal.load(Marshal.dump(@grid))
    @possibilities.each_with_index do |line,lindex|
      line.each_with_index do |cell,cindex|
        if cell.nil?
          values = check_box(lindex,cindex)
          values = values | check_column(cindex)
          values = values | check_line(lindex)
          @possibilities[lindex][cindex] = values
        else
          @possibilities[lindex][cindex] = [cell]
        end
      end
    end
  end

  def parse_input
    @content.split("\n").each do |e|
      next if e[0] == '-'
      @grid.push parse_line(e).flatten
    end
  end
  def parse_line(line)
    line.split('|').collect do |x| 
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

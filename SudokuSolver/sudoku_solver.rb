require 'pry'
class SudokuSolver
  def initialize(fh)
    @content = File.read(fh)
    @grid = []
  end
  def generate_output_string
    parse_input
    solve(@grid)
  end

  def solve(grid)
    if valid_solution?(grid)
      grid
    else
      possibilities = generate_possibilities(grid)
      binding.pry
      moves = select_best_moves(possibilities)
    end
  end

  private

  def generate_possibilities(grid)
    possibilities = Marshal.load(Marshal.dump(grid))
    possibilities.each_with_index do |line,lindex|
      line.each_with_index do |cell,cindex|
        if cell.nil?
          values = check_box(lindex,cindex,grid)
          values = check_column(cindex,values,grid)
          values = check_line(lindex,values,grid)
          possibilities[lindex][cindex] = values
        else
          possibilities[lindex][cindex] = [cell]
        end
      end
    end
    possibilities
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
  
  def check_box(lindex,cindex,grid)
    line_offset = lindex.divmod(3).first
    case line_offset
      when 0
        coors = ((0..2).to_a.product((0..2).to_a)) - [[lindex,cindex]]
        extract_box_values(coors,grid)
      when 1
        coors = ((3..5).to_a.product((3..5).to_a)) - [[lindex,cindex]]
        extract_box_values(coors,grid)
      when 2
        coors = ((6..-1).to_a.product((6..-1).to_a)) - [[lindex,cindex]]
        extract_box_values(coors,grid)
    end
  end
  
  def extract_box_values(coordinate_list,grid)
    possible_values = (1..9).to_a
    coordinate_list.each do |coordinate|
      if grid[coordinate.first][coordinate.last]
        possible_values = possible_values - [grid[coordinate.first][coordinate.last]]
      end
    end
    possible_values
  end

  def check_column(cindex,curent_values,grid)
    column_values = []
    (0..8).each do |line_index|
      column_values.push grid.at(line_index).at(cindex) unless grid.at(line_index).at(cindex).nil?
    end
    curent_values - column_values
  end
  
  def check_line(lindex,curent_values,grid)
    line_values = []
    (0..8).each do |column_index|
      line_values.push grid.at(lindex).at(column_index) unless grid.at(lindex).at(column_index).nil?
    end
    curent_values - line_values
  end
end

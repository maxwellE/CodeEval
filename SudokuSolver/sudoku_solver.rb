require 'pry'
class SudokuSolver
  def initialize(fh)
    @content = File.read(fh)
    @grid = []
  end
  def generate_output_string
    parse_input
    solve
  end

  def solve
=begin
    closedset = []
    openset = []
    previous_moves = []
    openset.push [nil,@grid]
    until openset.empty?
      grid_state = openset.pop.last
      if valid_solution?(grid_state)
        return grid_state
      else
        closedset.push grid_state
        possibilities = generate_possibilities(grid_state)
        moves = select_best_moves(possibilities)
        moves.each do |move|
          move.last.each do |value|
            next_grid_state = make_move(move.first,value,grid_state)
            move_tuple = ["#{move.first},#{value}".to_sym, next_grid_state]
            next if closedset.include? move_tuple
            openset.push move_tuple
            puts move_tuple.first
            puts move_tuple.last.inspect
            puts "=======!!!!!"*4
          end
        end
      end
    end
=end
    stringify_grid(@grid)
  end

  private

  def stringify_grid(grid)
    joined_columns = grid.collect do |line|
      fixed_line = line.map do |x|
        if x.nil?
          "."
        else
          x
        end
      end
      fixed_line.each_slice(3).to_a.map{|x| x.join}.join("|")
    end
    joined_columns.each_slice(3).to_a.map{|x| x.join "\n"}.join("\n-----------\n").strip
  end
  
  def generate_possibilities(grid)
    possibilities = Marshal.load(Marshal.dump(grid))
    grid.each_with_index do |line,lindex|
      line.each_with_index do |cell,cindex|
        if cell.nil?
          values = check_box(lindex,cindex,grid)
          values = check_column(cindex,values,grid)
          values = check_line(lindex,values,grid)
          possibilities[lindex][cindex] = values
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

  def valid_solution?(grid)
    grid.flatten.compact.each do |val|
      if val.nil? || grid.count(val) != 9
        return false
      end
    end
    return true
  end

  def select_best_moves(possibilities)
    indexed_possibilites = {}
    possibilities.each_with_index do |line,lindex|
      possibilities.each_with_index do |column, cindex|
        indexed_possibilites["#{lindex},#{cindex}"] = possibilities[lindex][cindex]
      end
    end
    begin
    sorted_possibilities = indexed_possibilites.sort_by{|k,v| v.length}
  rescue
    binding.pry
  end
    sorted_possibilities
  end
  def make_move(coordinates,value,grid_state)
    new_state = Marshal.load(Marshal.dump(grid_state))
    true_coordinates = coordinates.split(",").map{|x| x.to_i}
    new_state[true_coordinates.first][true_coordinates.last] = value if new_state[true_coordinates.first][true_coordinates.last].nil?
    new_state
  end
end

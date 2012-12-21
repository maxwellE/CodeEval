#!/usr/bin/env ruby
class LowestCommonAncestor
  TREE = {
    30 => [8,52],
    8 => [3,20],
    20 => [10,29]
  }
  def initialize(arg_str)
    split_str = arg_str.split(' ')
    @left_val = split_str.shift.to_i
    @right_val = split_str.shift.to_i
  end
  def lowest_common_ancestor
    TREE.each_pair do |k,v|
      if v.include?(@left_val) || v.include?(@right_val)
        return k
      end
    end
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    lca = LowestCommonAncestor.new(line.strip)
    puts lca.lowest_common_ancestor
  end
end
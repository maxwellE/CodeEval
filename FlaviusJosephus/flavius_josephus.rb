#!/usr/bin/env ruby -wKU
class FlaviusJosephus
  def initialize(args)
    split_args = args.split(',')
    @people = split_args.shift.to_i
    @execute = split_args.shift.to_i
  end
  def eliminate_order
    nums = (0...@people).to_a
    execute_order = []
    until nums.empty?
      nums.rotate!(@execute-1)
      execute_order.push nums.shift
    end
    execute_order.join(' ')
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    fj = FlaviusJosephus.new(line.strip)
    puts fj.eliminate_order
  end
end

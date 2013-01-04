#!/usr/bin/env ruby -wKU
class ReverseGroups
  def initialize(args)
    split_line = args.strip.split(';')
    @nums = split_line.first.split(',').map{|x| x.to_i}
    @size = split_line.last.to_i
  end
  def reverse_groups
    reversed = []
    @nums.each_slice(@size) do |x| 
      reversed.push x.size == @size ? x.reverse : x
    end
    reversed.map{|x| x.join(',')}.join(',')
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    rb = ReverseGroups.new(line.strip)
    puts rb.reverse_groups
  end
end

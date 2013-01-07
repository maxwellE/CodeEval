#!/usr/bin/env ruby -wKU
class StringList
  def initialize(str)
    split_str = str.split(',')
    @size = split_str.shift.to_i
    @str = split_str.shift
  end
  
  def get_list
    cartprod([@str.split('')]*@size).uniq.sort.collect{|x| x.join}.join(',')
  end

  def cartprod(ary) 
    result = [[]] 
    until ary.empty?
      t, result = result, [] 
      b = ary.shift
      t.each do |a| 
        b.each do |n| 
          result << a + [n] 
        end 
      end 
    end 
    result 
  end 
end
if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    sl = StringList.new(line.strip)
    puts sl.get_list
  end
end

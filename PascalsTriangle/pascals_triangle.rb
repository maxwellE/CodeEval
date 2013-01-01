#!/usr/bin/env ruby -wKU

class PascalsTriangle
  def initialize(size)
    @size = size
  end
  
  def generate_triangle
    triangle = Array.new(@size){|index| Array.new(index+1,0)} 
    triangle.each_with_index do |e,i|
      e.collect! do |x|
        col_e = choose(i,e.index(x))
      end
    end
    triangle.collect{|x| x.join(' ')}.join(' ')
  end

  def choose(n,k)
    pTop = (n-k+1 .. n).inject(1, &:*) 
    pBottom = (2 .. k).inject(1, &:*)
    pTop / pBottom
  end
end


if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    pt = PascalsTriangle.new(line.strip.to_i)
    puts pt.generate_triangle
  end
end
#!/usr/bin/env ruby -wKU
class StringPermutations 
  def initialize(str)
    @str = str
  end
  
  def find_permutations
    @str.split('').permutation.sort.map{|x| x.join}.join(',')
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    sp = StringPermutations.new(line.strip)
    puts sp.find_permutations
  end
end

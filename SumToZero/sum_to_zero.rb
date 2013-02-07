#!/usr/bin/env ruby -wKU
class SumToZero
  def initialize(string)
    @digits = string.strip.split(",").map{|x| x.to_i}
  end
  def find_sums
    count = 0
    @digits.combination(4).each do |combo|
      if combo.reduce(:+) == 0
        count +=1
      end
    end
    count.to_s
  end
end

if __FILE__ == $0
  File.open(ARGV[0]).each_line do |line|
    s20 = SumToZero.new(line.strip)
    puts s20.find_sums
  end
end
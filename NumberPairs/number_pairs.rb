#!/usr/bin/env ruby -wKU
File.open(ARGV[0]).each_line do |line|
  split_line = line.strip.split(';')
  nums = split_line.shift.split(',').map{|x| x.to_i}
  sum = split_line.shift.to_i
  sols = []
  nums.combination(2).each do |x|
    sols.push(x) if x.reduce(:+) == sum
  end
  if sols.empty?
    puts 'NULL'
  else
    sols.collect!{|x| x.join(',')}
    puts sols.join(';')
  end
end
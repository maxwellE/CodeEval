#!/usr/bin/env ruby
File.open(ARGV[0]).each_line do |line|
  start_int = line.strip.to_i
  ints = line.strip.split("").map{|x| x.to_i}
  sum = 0
  ints.each do |int|
    sum += int**line.strip.length
  end
  if sum == start_int
    puts "True"
  else
    puts "False"
  end
end
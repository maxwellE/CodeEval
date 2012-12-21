#!/usr/bin/env ruby -wKU
File.open(ARGV[0]).each_line do |line|
  num = line.strip.to_i
  1.upto(1000) do |iter|
    if num.to_s.reverse == num.to_s
      puts "#{iter-1} #{num}"
      break
    else
      num += num.to_s.reverse.to_i
    end
  end
end
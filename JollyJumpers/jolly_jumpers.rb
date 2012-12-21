#!/usr/bin/env ruby -wKU

File.open(ARGV[0]).each_line do |line|
nums = line.strip.split(' ').map{|x| x.to_i}
    n = nums.shift
    subs = []
    until nums.empty?
      digit = nums.shift
      if nums.first
        subs.push((nums.first - digit).abs)
      end
    end
    if subs.sort == (1..(n-1)).to_a
      puts 'Jolly'
    else
      puts 'Not jolly'
    end
end
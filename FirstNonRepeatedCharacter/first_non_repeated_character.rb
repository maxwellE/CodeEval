#!/usr/bin/env ruby -wKU

File.open(ARGV[0]).each_line do |line|
  chars = line.strip.chars.to_a
  res = nil
  chars.each do |char|
    if chars.one?{|c| c == char}
      res = char
      break
    end
  end
  puts res
end

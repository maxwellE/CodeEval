#!/usr/bin/env ruby -wKU

class BeautifulStrings
  def initialize(string)
    @string = string
  end
  def beauty_score
    char_counts= {}
    char_values = (1..26).to_a.reverse
    @string.gsub!(/[^[:alpha:]]/,"")
    @string.downcase.split("").each do |char|
      if char_counts[char]
        char_counts[char] +=1
      else
        char_counts[char] = 1
      end
    end
    sum = 0
    char_counts.sort_by{|k,v| v}.reverse.each do |pair|
      sum += char_values.shift*pair.last
    end
    sum.to_s
  end
end

if __FILE__ == $0
  File.open(ARGV[0]).each_line do |line|
    bs = BeautifulStrings.new(line.strip)
    puts bs.beauty_score
  end
end


#!/usr/bin/env ruby -wKU
class LongestCommonSubsequence
  def initialize(str)
    split_str = str.split(';')
    @str1 = split_str.shift
    @str2 = split_str.shift
  end

  def get_longest_common_subsequence
    if @str2.nil? || @str1.nil?
      return ""
    end
    if @str2.empty? || @str1.empty?
      return ""
    end
    longest_common_subsequence(@str1,@str2)
  end

  def longest_common_subsequence(str1,str2)
    lengths = Array.new(str1.size+1) { Array.new(str2.size+1) { 0 } }
    str1.split('').each_with_index { |x, i|
        str2.split('').each_with_index { |y, j|
            if x == y
                lengths[i+1][j+1] = lengths[i][j] + 1
            else
                lengths[i+1][j+1] = [lengths[i+1][j], lengths[i][j+1]].max
            end
        }
    }
    result = ""
    x, y = str1.size, str2.size
    while x != 0 and y != 0
        if lengths[x][y] == lengths[x-1][y]
            x -= 1
        elsif lengths[x][y] == lengths[x][y-1]
            y -= 1
        else
            result << str1[x-1]
            x -= 1
            y -= 1
        end
    end
    result.reverse
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    lcs = LongestCommonSubsequence.new(line.strip)
    puts lcs.get_longest_common_subsequence
  end
end

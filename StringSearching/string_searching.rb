#!/usr/bin/env ruby -wKU
class StringSearching
  def initialize(str)
    split_str = str.split(',')
    @str1 = split_str.shift
    @str2 = split_str.shift
  end
  def match?
    @str1.gsub!(/\\\*/,"\\\*")
    @str2.gsub!(/\\\*/,"\\\*")
    @str1.gsub!(/(?<!\\)\*/,'.*')
    @str2.gsub!(/(?<!\\)\*/,'.*')
    if @str1 =~ /#{@str2}/
      "true"
    else
      "false"
    end
  end
end
if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    puts StringSearching.new(line.chomp).match?
  end
end

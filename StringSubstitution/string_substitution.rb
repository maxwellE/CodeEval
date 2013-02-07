#!/usr/bin/env ruby

class StringSubstitution
  def initialize(arg_str)
    split_str = arg_str.split(';')
    @starting_string = split_str.shift
    @patterns = split_str.shift.split(',').each_slice(2).to_a
  end
  
  def perform_substitutions
    @patterns.each do |pattern|
      @starting_string.gsub!(pattern.first,pattern.last.tr("10","AB"))
    end
    @starting_string.tr("AB","10")
  end
end
if __FILE__ == $0
  File.open(ARGV[0]).each_line do |line|
    ss = StringSubstitution.new(line.strip)
    puts ss.perform_substitutions
  end
end

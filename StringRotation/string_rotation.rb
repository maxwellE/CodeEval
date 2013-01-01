#!/usr/bin/env ruby -wKU

class StringRotation
  def initialize(str_arg)
    split_str = str_arg.split(',')
    @base_string = split_str.first.split('')
    @rotated_string = split_str.last.split('')
  end
  
  def valid_rotation?
    if @base_string.size == @rotated_string.size
      @base_string.size.times do
        if @base_string.join == @rotated_string.join
          return true
        else
          @rotated_string.rotate!
        end
      end
    else
      false
    end
    false
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    sr = StringRotation.new(line.chomp)
    if sr.valid_rotation?
      puts "True"
    else
      puts "False"
    end
  end
end
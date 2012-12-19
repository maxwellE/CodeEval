#!/usr/bin/env ruby
class FizzBuzzer
  def initialize(fizz_val,buzz_val,upper_bound)
    @upper_bound = upper_bound
    @fizz_val = fizz_val
    @buzz_val = buzz_val
  end
  def create_output
    output =""
    1.upto(@upper_bound) { |anInt|
      if anInt % (@fizz_val * @buzz_val) == 0 
        output << "FB "
      elsif anInt % @fizz_val == 0
        output << "F "
      elsif anInt % @buzz_val == 0
        output << "B "
      else
        output << anInt.to_s + " "
      end
    }
    return output.strip
  end
end

def main
  File.open(ARGV[0]).each_line do |line|
    args = line.strip.split(' ').map{|x| x.to_i}
    fb = FizzBuzzer.new(args.first,args.at(1),args.last)
    puts fb.create_output
  end
end

if $0 == __FILE__
  main
end

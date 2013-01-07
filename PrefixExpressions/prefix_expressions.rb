#!/usr/bin/env ruby -wKU
class PrefixExpressions
  def initialize(str)
    @operators = []
    @digits = []
    str.split(' ').each do |char|
      if char =~ /\d+/
        @digits.push char.to_i
      else
        if char =="*"
          @operators.push :mul
        elsif char == "+"
          @operators.push :add
        else
          @operators.push :div
        end  
      end
    end
  end
  
  def expression_result
    return "" if @digits.empty?
    if @digits.size == 1
      return @digits.first
    end
    first_val = @digits.shift
    second_val = @digits.shift
    result = execute_expression(first_val,second_val,@operators.pop) 
    @digits.each do |digit|
      result = execute_expression(result,digit,@operators.pop)
    end
    result
  end

  def execute_expression(val1,val2,op)
    case op
    when :add
      val1 + val2
    when :mul
      val1 * val2
    when :div
      val1 / val2
    end
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    pe = PrefixExpressions.new(line.strip)
    puts pe.expression_result
  end
end

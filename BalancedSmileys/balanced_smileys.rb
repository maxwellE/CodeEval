#!/usr/bin/env ruby
class BalancedSmileys
  def initialize(smile_string)
    @smile_string = smile_string
  end
  
  def is_balanced?(str,paren_count)
    return false if paren_count < 0
    if str == "" || str.nil?
      return paren_count == 0
    end
    first_two = str[0..1]
    if first_two == ":)"
      return is_balanced?(str[2..-1],paren_count) || is_balanced?(str[2..-1],paren_count-1)
    elsif first_two == ":("
      return is_balanced?(str[2..-1],paren_count) || is_balanced?(str[2..-1],paren_count+1)
    else
      case str[0]
        when "("
          return is_balanced?(str[1..-1],paren_count+1)
        when ")"
          return is_balanced?(str[1..-1],paren_count-1)
        else
          return is_balanced?(str[1..-1],paren_count)
      end  
    end
    return false
  end
  
  def valid?
    return "YES" if is_balanced?(@smile_string,0)
    return "NO"
  end
end

if __FILE__ == $0
  File.open(ARGV[0]).each_line do |line|
    bs = BalancedSmileys.new(line)
    puts bs.valid?
  end
end

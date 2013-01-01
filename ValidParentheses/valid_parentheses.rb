#!/usr/bin/env ruby
class ValidParentheses
  def initialize(paren_str)
    @paren_str = paren_str
  end
  def valid_parens?
    begin
      eval @paren_str
      "True"
    rescue SyntaxError
      if $!.to_s =~ /unexpected '[\(\)\{\}\[\]]', expecting '[\(\)\{\}\[\]]'|syntax error, unexpected '[\(\)\{\}\[\]]'/
        if $!.to_s !~ /ASSOC/
          return "False"
        end
      end
      "True"
    end
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    vp = ValidParentheses.new(line.chomp)
    puts vp.valid_parens?
  end
end
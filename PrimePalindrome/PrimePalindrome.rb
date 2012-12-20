#!/usr/bin/env ruby
require 'mathn'
class PrimePalindrome
  def initialize(upper_bound)
    @upper_bound = upper_bound+1
  end
  def biggest_prime_palindrome
    @upper_bound.downto(1) do |int|
      if int.to_s == int.to_s.reverse && int.prime?
        return int
      end
    end
  end
end

def main
  pp = PrimePalindrome.new(1000)
  puts pp.biggest_prime_palindrome
end

if $0 == __FILE__
  main
end

#!/usr/bin/env ruby -wKU
class MinimumCoins
  def initialize(sum)
    @sum = sum
    @coins = 0
  end
  def number_of_coins_required
    div_coins_and_sum(5)
    div_coins_and_sum(3)
    div_coins_and_sum(1)
    @coins
  end

  def div_coins_and_sum(div)
    divmod_ary = @sum.divmod(div)
    @coins += divmod_ary.first
    @sum = divmod_ary.last
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    mc = MinimumCoins.new(line.strip.to_i)
    puts mc.number_of_coins_required
  end
end

#!/usr/bin/env ruby -wKU

class CashRegister
  REGISTER = {
   "ONE HUNDRED"=> 100.0,
   "FIFTY"=> 50.0,
   "TWENTY"=> 20.0,
   "TEN" => 10.0,
   "FIVE" => 5.0,
   "TWO" => 2.0,
   "ONE"=> 1.0,
   "HALF DOLLAR" => 0.5,
   "QUARTER" => 0.25,
   "DIME"=> 0.1,
   "NICKEL" => 0.05,
   "PENNY"=> 0.01
   }
  def initialize(arg_str)
    split_string = arg_str.split(';')
    @purchase_price = split_string.first.to_f
    @cash_given = split_string.last.to_f
  end
  
  def get_change
    return 'ERROR' if @cash_given < @purchase_price
    remainding_change = (@cash_given - @purchase_price).round(2)
    change = []
    until remainding_change == 0.0
      change.push REGISTER.detect{|k,v| remainding_change.divmod(v).first>0}
      remainding_change = remainding_change.divmod(change.last.last).last.round(2)
    end
    result = change.collect{|x| x.first}.sort.join(',')
    if result.empty?
      "ZERO"
    else
      result
    end
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    cr = CashRegister.new(line.strip)
    puts cr.get_change
  end
end
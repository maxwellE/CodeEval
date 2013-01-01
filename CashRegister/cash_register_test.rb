require "test/unit"

require_relative "cash_register"

class TestCashRegister < Test::Unit::TestCase
  def setup
    @cr1 = CashRegister.new('15.94;16.00')
    @cr2  = CashRegister.new('17;16')
    @cr3 = CashRegister.new('35;35')
    @cr4 = CashRegister.new('45;50')
  end
  
  def test_receive_correct_change
    assert_equal(@cr1.get_change, 'NICKEL,PENNY')
    assert_equal(@cr2.get_change, 'ERROR')
    assert_equal(@cr3.get_change, 'ZERO')
    assert_equal(@cr4.get_change, 'FIVE')
  end
end
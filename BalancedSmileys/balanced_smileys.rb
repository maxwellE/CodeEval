require 'pry'
class BalancedSmileys
  def initialize(smile_string)
    @smile_string = smile_string
  end
  
  def valid?
    binding.pry
  end
end
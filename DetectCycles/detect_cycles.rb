#!/usr/bin/env ruby
class DetectCycles
  def initialize(ary)
    @ary = ary
  end
  def find_cycle
    (@ary.size).downto(2) do |x|
      (@ary).each_cons(x) do |cons_ary|
        1.upto(cons_ary.size-1) do |size|
          if cons_ary.rotate(size) == cons_ary
            return cons_ary.slice(0..size-1)
          end
        end
      end
    end
    return nil
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    dc = DetectCycles.new(line.strip.split(' ').map{|x| x.to_i})
    res = dc.find_cycle
    unless res.nil?
      puts res.join(' ')
    end
  end
end
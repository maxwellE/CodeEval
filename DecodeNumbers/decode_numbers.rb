#!/usr/bin/env ruby -wKU
class DecodeNumbers
  DECODE_MAP = Hash[26.downto(1).to_a.zip(('A'..'Z').to_a.reverse)] 
  def initialize(args)
    @decode_str = args.strip
  end
  def number_of_decodings
    closedset = []
    openset = []
    openset.push @decode_str
    count = 0
    until openset.empty?
      state = openset.shift
      if state == ""
        count +=1
      else
        closedset.push state
        DECODE_MAP.keys.each do |key|
          next unless state.start_with? key.to_s
          next_state = state.gsub(/\A#{key.to_s}/,'')
          openset.push next_state
        end
      end
    end
    count
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    dn = DecodeNumbers.new(line.strip)
    puts dn.number_of_decodings
  end
end

#!/usr/bin/env ruby
class OverlappingRectangles
  def initialize(args)
   coors = args.strip.split(',').map{|x| x.to_i}
   @coor_hash = {
     :AupperX => coors.first,
     :AupperY => coors.at(1),
     :AlowerX => coors.at(2),
     :AlowerY => coors.at(3),
     :BupperX => coors.at(4),
     :BupperY => coors.at(5),
     :BlowerX => coors.at(6),
     :BlowerY => coors.at(7)
   }
  end
  def do_they_overlap?
    a_rect_coors = (@coor_hash[:AupperX]..@coor_hash[:AlowerX]).to_a.product (@coor_hash[:AlowerY]..@coor_hash[:AupperY]).to_a
    b_rect_coors = (@coor_hash[:BupperX]..@coor_hash[:BlowerX]).to_a.product (@coor_hash[:BlowerY]..@coor_hash[:BupperY]).to_a
    if (a_rect_coors & b_rect_coors).empty?
      "False"
    else
      "True"
    end
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    orec = OverlappingRectangles.new(line.strip)
    puts orec.do_they_overlap?
  end    
end

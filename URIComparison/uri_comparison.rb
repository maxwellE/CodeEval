#!/usr/bin/env ruby -wKU
require 'uri'
class URIComparison 
  def initialize(str)
    split_str = str.split(';')
    @url1 = split_str.shift
    @url2 = split_str.shift
  end
  def are_equivalent
    fixup_urls
    if @url2.to_s == @url1.to_s
      "True"
    else
      "False"
    end
  end
  def fixup_urls
     @url1 = URI(URI.unescape(@url1)).normalize
     @url2 = URI(URI.unescape(@url2)).normalize
  end
end

if $0 == __FILE__
  File.open(ARGV[0]).each_line do |line|
    urlcomp = URIComparison.new(line.strip)
    puts urlcomp.are_equivalent
  end
end

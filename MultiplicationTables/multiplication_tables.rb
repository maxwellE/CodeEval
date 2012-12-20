require 'pry'
dimension = 12
table = []
(1..dimension).each do |val|
  table.push [val]
end
dimension.times do
  table.each_with_index do |e,i|
  if i == 0
    e.push(e.last + 1) unless e.size+1 > dimension
  else
    e.push((e.size+1) * (i+1)) unless e.size+1 > dimension
  end
  end
end
table.each do |row|
  row.each do |val|
    res = ""
    size = 4 - val.to_s.length
    res << ' '*size
    res << val.to_s
    print res
  end
  puts ''
end
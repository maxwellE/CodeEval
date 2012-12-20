found_bad = false
  line = "1210"
  val = line.split('').map{|x| x.to_i}
  val.each_with_index do |e,i|
    if val.select{|x| x == i}.size != e
      found_bad = true
      break
    end
  end
  if found_bad
    puts 0
  else
    puts 1
  end
gets # 使わない
s = gets.chomp.chars

pos = Struct.new(:x, :y).new(0, 0)
map = {pos.dup => true}

s.each do |action|
  case action
  when "R" then pos.x += 1
  when "L" then pos.x -= 1
  when "U" then pos.y += 1
  when "D" then pos.y -= 1
  end

  if map.key?(pos)
    puts "Yes"
    exit
  end

  map[pos.dup] = true
end

puts "No"

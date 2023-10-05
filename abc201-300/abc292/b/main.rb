(n, _q) = gets.chomp.split.map(&:to_i)

status = Array.new(n, 0)

while line = gets&.chomp
  (event, target) = line.split.map(&:to_i)
  target -= 1 # 0-base index

  case event
  when 1 #Yello card
    status[target] += 1
  when 2
    status[target] += 2
  when 3
    puts status[target] >= 2 ? "Yes" : "No"
  end
end

gets # N M
head = 0
tail = 0
map = Hash.new

while line = gets&.chomp
  (x, y) = line.split.map(&:to_i)
  map[x] ||= []
  map[x] << y

  if head.zero? || head == y
    head = x
  end

  if tail.zero? || tail == x
    tail = y
  end
end

answer = []
current = head
loop do
  answer << current
  if current == tail
    break
  end

  if map[current]
    current = map[current].first
  else
    puts "No"
    exit
  end
end

puts "Yes"
puts answer.join(" ")

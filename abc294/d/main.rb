n, _q = gets.split.map(&:to_i)

waiting = 1
reception = [true] * (n + 1)
reception[0] = false
not_go = 1

while line = gets&.chomp
  (event, x) = line.split.map(&:to_i)

  case event
  when 1
    # 待ちに移動
    reception[waiting] = true
    waiting += 1
  when 2
    reception[x] = false
  when 3
    not_go += 1 until reception[not_go]
    puts not_go
  end
end

n, _q = gets.split.map(&:to_i)

waiting = 1
reception = {}

while line = gets&.chomp
  (event, x) = line.split.map(&:to_i)

  case event
  when 1
    # 待ちに移動
    reception[waiting] = true
    waiting += 1
  when 2
    reception.delete(x)
  when 3
    puts reception.first.first
  end
end

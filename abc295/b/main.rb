r, c = gets.split.map(&:to_i)

bomb = [] # ボムの位置
map = []  # マップ

r.times.each_with_index do |i|
  input = gets.chomp.chars

  # ボムの位置を把握
  map << []
  input.each_with_index do |c, j|
    if c == '.' || c == '#'
      map[-1] << c
    else
      bomb << [c.to_i, i, j]
      map[-1] << '.'
    end
  end
end

def do_bomb(map, power, i, j)
  # 原点を爆発
  map[i][j] = '.'

  # 左右を爆発させる
  power.times do |k|
    n = j - k - 1 # 0始まり
    map[i][n] = '.' if n >= 0

    n = j + k + 1 # 0始まり
    map[i][n] = '.' unless map[i][n].nil?
  end
end

bomb.each do |(power, i, j)|
  (0..power).each do |k|
    do_bomb(map, power - k, i - k, j) if i - k >= 0
    do_bomb(map, power - k, i + k, j) if i + k < r
  end
end

puts map.map {|m| m.join}.join("\n")

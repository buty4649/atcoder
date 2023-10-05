# frozen_string_literal: true

n, m, h, k = gets.split.map(&:to_i)
s = gets.chomp.chars

Point = Struct.new(:x, :y)

# アイテムを取得
items = m.times.to_h do
  position = gets.split.map(&:to_i)
  pt = Point.new(*position)
  [pt, true]
end

# 初期位置
pt = Point.new(0, 0)

# sをループしていく
s.each do |move|
  case move
  when 'U'
    pt.y += 1
  when 'D'
    pt.y -= 1
  when 'R'
    pt.x += 1
  when 'L'
    pt.x -= 1
  end

  # HPが１下がる
  h -= 1

  # HPが0未満になったら終わり
  if h.negative?
    puts 'No'
    exit
  end

  # アイテムがあれば取得する
  if h < k && items[pt]
    h = k
    items[pt] = false
  end
end

# 移動成功
puts 'Yes'

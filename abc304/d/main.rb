# frozen_string_literal: true

w, h = gets.split.map(&:to_i)

# いちごの位置
strawberries = {}
gets.to_i.times do
  x, y = gets.split.map(&:to_i)
  strawberries[x] ||= {}
  strawberries[x][y] = true
end

#  縦に切る線
gets.to_i # aの個数
a = gets.split.map(&:to_i)
# 原点と終点を追加
a.unshift(0)
a.push(w)

# 横に切る線
gets.to_i # bの個数
b = gets.split.map(&:to_i)
# 原点と終点を追加
b.unshift(0)
b.push(h)

min = 2 * (10**5)
max = 0

a.each_cons(2) do |(prev_x, next_x)|
  b.each_cons(2) do |(prev_y, next_y)|
    count = 0
    (prev_x...next_x).each do |x|
      (prev_y...next_y).each do |y|
        count += 1 if strawberries.dig(x, y)
      end
    end

    min = count if count < min
    max = count if count > max
  end
end

puts [min, max].join(' ')

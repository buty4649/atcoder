# frozen_string_literal: true

n, m = gets.split.map(&:to_i)

# 大きい順に累積和を取っておく
a = gets.split.map(&:to_i).tally.sort.reverse.to_a
(a.size - 1).times do |i|
  a[i + 1][1] = a[i][1] + a[i + 1][1]
end

# 小さい順に累積和を取っておく
b = gets.split.map(&:to_i).tally.sort.to_a
(b.size - 1).times do |i|
  b[i + 1][1] = b[i][1] + b[i + 1][1]
end

a.reverse!
b.reverse!
pp({a:a, b:b})

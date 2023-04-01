# frozen_string_literal: true
n = gets.to_i
a = gets.split.map(&:to_i).sort.reverse

# 奇数だったら最後に0を加える
a << 0 if n.odd?

puts a.each_slice(2).map { |x, y| x - y }.inject(:+)

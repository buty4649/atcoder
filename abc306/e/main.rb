# frozen_string_literal: true

n, k, q = gets.chomp.split.map(&:to_i)

a = Array.new(n, 0)

q.times do
  i, y = gets.chomp.split.map(&:to_i)
  a[i - 1] = y
  puts a.sort[-k..].sum
end

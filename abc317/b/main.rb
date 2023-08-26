# frozen_string_literal: true

n = gets.to_i
a = gets.split.map(&:to_i)

a.sort!
(1...a.size).each do |i|
  # １つ前と2以上あいていたら、間の数が答え
  next if a[i] - a[i-1] < 2
  puts a[i-1] + 1
  exit
end

# frozen_string_literal: true

n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort

answer = a.count.times.map do |i|
  (a.bsearch_index { |x| x - a[i] >= m } || n) - i
end.max

puts answer

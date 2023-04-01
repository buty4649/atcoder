# frozen_string_literal: true

require 'prime'

n, m = gets.split.map(&:to_i)

if n.pow(2) < m
  puts '-1'
  exit
end

max = n.pow(2)
(m..max).each do |x|
  if x.prime?
    next if x > n

    puts x
    exit
  end

  div = x.prime_division
  a = div.first.first.pow(div.first.last)

  if div.size == 1
    next if a > max

    puts x
    exit
  end

  b = div.last.first.pow(div.last.last)
  if a <= max && b <= max
    puts x
    exit
  end
end

puts '-1'

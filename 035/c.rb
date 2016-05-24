#!/usr/bin/env ruby

num, _ = STDIN.gets.split.map(&:to_i)

class Othello
  def initialize(n)
    @s = 0
    @n = n
  end

  def reverse(left, right)
    num = right - left
    re = (1 << (num + 1)) -1
    @s ^= re << (left - 1)
  end

  def to_s
    s = @s.to_s(2)
    ("0" * (@n - s.length) + s).reverse
  end
end

o = Othello.new(num)

STDIN.each do |line|
  l, r = line.split
  o.reverse(l.to_i, r.to_i)
end

puts o.to_s

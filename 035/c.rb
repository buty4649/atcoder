#!/usr/bin/env ruby

num, _ = STDIN.gets.split.map(&:to_i)

class Othello
  attr_reader :s
  def initialize(n)
    @s = "0" * n
  end

  def reverse(left, right)
    l = left.to_i - 1
    r = right.to_i - 1
    before = l > 0 ? @s.slice(0..l-1) : ""
    after  = @s.slice(r+1..@s.length)
    target = @s.slice(l..r).split(//).map{|s| s.to_i == 0 ? "1" : "0" }.join("")

    @s = "#{before}#{target}#{after}"
  end
end

o = Othello.new(num)

STDIN.each do |line|
  l, r = line.split
  o.reverse(l, r)
end

puts o.s

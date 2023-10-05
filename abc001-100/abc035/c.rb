#!/usr/bin/env ruby

num, _ = STDIN.gets.split.map(&:to_i)

class Othello
  def initialize(n)
    @n = n
    @board = Array.new(n+2, 0)
  end

  def reverse(left, right)
    @board[left]   += 1
    @board[right+1]-= 1
  end

  def to_s
    answer = ""
    (1..@n).each do |i|
      @board[i] += @board[i-1]
      answer <<= @board[i].even? ? "0" : "1"
    end
    answer
  end
end

o = Othello.new(num)

STDIN.each do |line|
  l, r = line.split
  o.reverse(l.to_i, r.to_i)
end

puts o.to_s

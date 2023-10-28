# frozen_string_literal: true

def check?(n)
  a, b, c = n.to_s.chars.map(&:to_i)
  a * b == c
end

n = gets.to_i

loop do
  break if check?(n)

  n += 1
end

puts n

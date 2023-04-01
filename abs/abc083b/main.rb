# frozen_string_literal: true
n, a, b = gets.split.map(&:to_i)

def sum_digits(n)
  n.to_s.chars.map(&:to_i).inject(:+)
end

c = (1..n).to_a.inject(0) do |sum, i|
  sd = sum_digits(i)
  if sd >= a && sd <= b
    sum + i
  else
    sum
  end
end

puts c

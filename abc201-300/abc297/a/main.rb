# frozen_string_literal: true

_n, d = gets.split.map(&:to_i)
t = gets.split.map(&:to_i)

(1...t.size).each do |i|
  if t[i] - t[i - 1] <= d
    puts t[i]
    exit
  end
end

puts(-1)

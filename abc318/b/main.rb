# frozen_string_literal: true

n = gets.to_i

sheets = Array.new
answer = 0

n.times do |i|
  a, b, c, d = gets.split.map(&:to_i)

  (c...d).each do |y|
    sheets[y] ||= []
    (a...b).each do |x|
      answer += 1 unless sheets[y][x]
      sheets[y][x] = true
    end
  end
end

puts answer

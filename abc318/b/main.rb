# frozen_string_literal: true

n = gets.to_i

filed = Array.new(100) { Array.new(100, false) }

n.times do
  a,b,c,d = gets.split.map(&:to_i)

  (a..b).each do |x|
    (c..d).each do |y|
      filed[x][y] = true
    end
  end
end

puts filed.flatten.count(true)

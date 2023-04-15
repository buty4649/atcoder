# frozen_string_literal: true

n = gets.to_i

a = n.times.map { gets.split.map(&:to_i) }
b = n.times.map { gets.split.map(&:to_i) }

def check(n, a, b)
  n.times do |i|
    n.times do |j|
      return false if a[i][j] == 1 && b[i][j] != 1
    end
  end
  true
end

4.times do
  if check(n, a, b)
    puts 'Yes'
    exit
  end
  a = a.transpose.map(&:reverse)
end

puts 'No'

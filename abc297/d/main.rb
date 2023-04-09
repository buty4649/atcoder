# frozen_string_literal: true

a, b = gets.split.map(&:to_i)

count = 0
while a != b
  if a > b
    count += a / b
    a %= b
  else
    count += b / a
    b %= a
  end

  if a.zero? || b.zero?
    count -= 1
    break
  end
end

puts count

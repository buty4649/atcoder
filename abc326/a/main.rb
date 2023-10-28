# frozen_string_literal: true

x, y = gets.split.map(&:to_i)
d = y - x

if d.positive? && d <= 2 || (d.negative? && d >= -3)
  puts 'Yes'
else
  puts 'No'
end

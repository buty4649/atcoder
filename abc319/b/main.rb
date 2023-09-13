# frozen_string_literal: true

n = gets.to_i

result = (n + 1).times.map do |i|
  next 1 if i.zero?

  (1..9).find do |j|
    (i * j % n).zero?
  end || '-'
end.join

puts result

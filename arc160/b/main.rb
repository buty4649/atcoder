# frozen_string_literal: true

require 'set'

_t = gets.to_i

while (n = gets&.to_i)
  count = 0

  n.times do |x|
    n.times do |y|
      count += n / (x + 1) / (y + 1)
    end
  end
  puts count
end

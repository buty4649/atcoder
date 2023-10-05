# frozen_string_literal: true

n = gets.to_i
s = n.times.map { gets.chomp }

# すべての組み合わせで試す
result = s.permutation(2).any? do |a, b|
  a + b == (a + b).reverse
end

puts result ? 'Yes' : 'No'

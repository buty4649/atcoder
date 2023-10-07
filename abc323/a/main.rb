# frozen_string_literal: true

s = gets.chomp
puts([1, 3, 5, 7, 9, 11, 13, 15].all? { |i| s[i] == '0' } ? 'Yes' : 'No')

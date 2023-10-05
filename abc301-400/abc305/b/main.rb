# frozen_string_literal: true

# 距離
dsitance = [
  3, # A-B
  1, # B-C
  4, # C-D
  1, # D-E
  5, # E-F
  9 # F-G
]

p, q = gets.split.map do |r|
  r.ord - 'A'.ord
end.sort

puts dsitance[p..q - 1].sum

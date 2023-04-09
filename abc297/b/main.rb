# frozen_string_literal: true

s = gets.chomp

# Bの位置をチェックする
b1 = s.index('B')
b2 = s.rindex('B')

# 奇数奇数、偶数偶数はNG
if b1.even? && b2.even? || b1.odd? && b2.odd?
  puts 'No'
  exit
end

# Kの位置
k = s.index('K')

# Rの位置
r1 = s.index('R')
r2 = s.rindex('R')

if k < r1 || k > r2
  puts 'No'
  exit
end

puts 'Yes'

# frozen_string_literal: true

_n, x = gets.split.map(&:to_i)

a = gets.split.each_with_object({}) do |s, h|
  h[s.to_i] = true
end

# xが0の場合正の数があればYesを出して終わり
if x.zero?
  puts a.keys.find(&:positive?) ? 'Yes' : 'No'
  exit
end

# x - keyをした値がaにあればYesを出して終わり
puts a.keys.find { |k| a[x + k] } ? 'Yes' : 'No'

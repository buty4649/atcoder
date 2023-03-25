s = gets.chomp.chars.map(&:to_i)

hash = Hash.new(0)
hash[0] = 1

s.inject(0) do |sum, v|
  sum ^= 1 << v
  hash[sum] += 1
  sum
end

puts hash.values.sum { |v| v * (v - 1) / 2}

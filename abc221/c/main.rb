n = gets.chomp.chars.map(&:to_i)

# 区切り位置を1つずつずらして全パターン試していく
memo = {}
max = 0

# すべての組み合わせの数列を作る
def permutation(ary)
  ary.repeated_permutation(ary.size).map do |a|
    next if a.first.zero?

    a.sort.reverse.inject(0) { |result, item| result * 10 + item }
  end.compact
end

(1...n.size).each do |i|
  left = permutation(n[0...i])
  right = permutation(n[i..])

  left.each do |l|
    next if max > 0 && Math.sqrt(max) > l

    right.each do |r|
      a = [l, r].sort
      m = memo[a] || l * r
      memo[a] = m

      max = [max, m].max
    end
  end
end

puts max

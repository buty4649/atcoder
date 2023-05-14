# frozen_string_literal: true

s = gets.chomp
n = gets.to_i

# ?を0に置き換えて最小値を計算しておく
answer = s.gsub('?', '0').to_i(2)

# 最小値がnを超えていたら-1
if answer > n
  puts '-1'
  exit
end

# ?を1に置き換えながらn以下の最大値を探す
result = s.chars.each_with_index.inject(answer) do |sum, (c, i)|
  if c != '?' || (sum | 1 << (s.size - i - 1)) > n
    sum
  else
    sum | 1 << (s.size - i - 1)
  end
end

puts result

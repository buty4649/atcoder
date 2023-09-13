# frozen_string_literal: true

n, m = gets.split.map(&:to_i)
l = gets.split.map(&:to_i)

# 単語間のスペース数を含めた長さ
words_length = [0, l.first]
(2..n).each do |i|
  words_length[i] = words_length[i - 1] + l[i - 1] + 1
end

if m == 1
  puts words_length.last
  exit
end

# 分割したときに最大の長さ
split_length = words_length.last / m

# 分割したときの最大の長さに近いように分割する
index = words_length[1..].bsearch_index { |i| i > split_length }
puts words_length[index + 1]

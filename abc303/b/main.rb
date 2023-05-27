# frozen_string_literal: true

require 'set'

n, m = gets.split.map(&:to_i)

# 並んでいる人一覧
memo = Set.new

while line = gets&.chomp
  line.split.map(&:to_i).each_cons(2) do |a, b|
    memo << [a, b].sort
  end
end

# 全ての人が並んでいるか
result = (1..n).to_a.permutation(2)
               .map(&:sort).uniq # [1,4]と[4,1]は同じ
               .sum do |a, b|
  memo.include?([a, b].sort) ? 0 : 1
end

puts result

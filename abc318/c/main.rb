# frozen_string_literal: true

n, d, p = gets.split.map(&:to_i)
f = gets.split.map(&:to_i).sort.reverse

# 周遊パスの枚数分でまとめて小さいを選ぶ
puts (f.each_slice(d).inject(0) do |sum, item|
  # 通常料金と周遊パスで安いほうを選ぶ
  sum + [item.sum, p].min
end)

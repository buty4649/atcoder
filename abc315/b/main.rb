# frozen_string_literal: true

m = gets.to_i
d = gets.split.map(&:to_i)

# 累積和を求めておく
dd = [0]
d.each { |di| dd << dd[-1] + di }

# 真ん中の日を計算
md = (dd[-1] + 1) / 2

# 真ん中の日を超える月を探す
dd.each_with_index do |di, i|
  next if di < md

  # 一つ前の月が答え
  puts "#{i} #{md - dd[i - 1]}"
  exit
end

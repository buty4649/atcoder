# frozen_string_literal: true

_n = gets.to_i
a = gets.split.map(&:to_i)

# 寝ている時間のみ抽出(偶数)
sleep_times = a.each_cons(2).to_a.each_with_index.select { |(_, i)| i.odd? }.map(&:first)

# 累積和を作っていく
times = Array.new(a.last + 1)
times[0] = 0
(a.last + 1).times do |i|
  next if i.zero?

  sleeing = sleep_times.any? do |s|
    i > s[0] && i <= s[1]
  end

  times[i] = times[i - 1] + (sleeing ? 1 : 0)
end

# 答えを出す
q = gets.to_i
q.times do
  l, r = gets.split.map(&:to_i)
  puts times[r] - times[l]
end

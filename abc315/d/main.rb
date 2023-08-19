# frozen_string_literal: true

h, w = gets.split.map(&:to_i)

# 印をつけたマップ
marks = []

# 手順1をしつつマップを作成
cookies = h.times.map do
  row = gets.chomp.split(//)
  marks << row.dup

  # 同じ色のクッキーを消す
  if t = row.tally.select{|_, v| v > 1}.keys
    marks.last.map! { |c| t.include?(c) ? nil : c }
  end

  row
end

# 行列を入れ替え
marks = marks.transpose
cookies = cookies.transpose

answer = 0

cookies.each_with_index do |row, i|
  # 同じ色がないクッキーを探す
  t = row.tally.select{|_, v| v == 1}.keys

  # 同じ色のないクッキーの数を足す
  answer += marks[i].count { |c| t.include?(c) }
end

puts answer

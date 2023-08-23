# frozen_string_literal: true

n, m = gets.split.map(&:to_i)
s = gets.chomp.chars
c = gets.chomp.split.map(&:to_i)

# カラーごとに文字列を格納
colors = Hash.new
c.each_with_index do |color, i|
  colors[color] ||= []
  colors[color] << s[i]
end

# 右巡回シフトする
colors = colors.keys.to_h do |key|
  [key, colors[key].rotate(-1)]
end

# もとに戻す
puts c.map { |cc| colors[cc].shift }.join

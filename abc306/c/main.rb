# frozen_string_literal: true

require 'set'

# すでに出てきた数値を格納する
s = Set.new

# 数値の真ん中の位置。Hashにしておいたほうがソートし易い
h = {}

_n = gets.to_i
gets.chomp.split.map(&:to_i).each_with_index do |a, index|
  if s.include?(a)
    # すでに真ん中がわかっている
    next if h.key?(a)

    h[a] = index
  else
    # 初登場
    s << a
  end
end

# 真ん中の位置でソートして出力
puts h.sort { |a, b| a[1] <=> b[1] }.map(&:first).join(' ')

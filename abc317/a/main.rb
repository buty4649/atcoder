# frozen_string_literal: true

n,h,x = gets.split.map(&:to_i)
p = gets.split.map(&:to_i)

# これ以上に最初になったpを出力
t = x - h
puts p.each_with_index.find{|e,_| e >= t}.last + 1

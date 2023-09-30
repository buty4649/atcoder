# frozen_string_literal: true

n, m = gets.split.map(&:to_i)
s = gets.chomp
t = gets.chomp

puts(if t.start_with?(s) && t.end_with?(s)
       0
     elsif t.start_with?(s)
       1
     elsif t.end_with?(s)
       2
     else
       3
     end)

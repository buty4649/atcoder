# frozen_string_literal: true

n = gets.to_i
a = gets.split.map(&:to_i).each_slice(7).to_a

puts n.times.map { |i| a[i].sum }.join(' ')

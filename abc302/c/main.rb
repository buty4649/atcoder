# frozen_string_literal: true

n, m = gets.split.map(&:to_i)
s = n.times.map { gets.chomp }

def diff(left, right, m)
  m.times.sum do |j|
    left[j] == right[j] ? 0 : 1
  end
end

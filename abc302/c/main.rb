# frozen_string_literal: true

n, m = gets.split.map(&:to_i)
s = n.times.map { gets.chomp }

def diff(left, right, m)
  m.times.sum do |i|
    left[i] == right[i] ? 0 : 1
  end
end

def search(s, n, m)
  (1...n).each.all? do |i|
    diff(s[i - 1], s[i], m) == 1
  end
end

answer = s.sort!.permutation.any? do |p|
  search(p, n, m)
end

puts answer ? 'Yes' : 'No'

# frozen_string_literal: true

n, y = gets.split.map(&:to_i)

def min(a, b)
  a < b ? a : b
end

def calc(n, y)
  return "0 0 #{n}" if 1000 * n == y
  return "0 #{n} 0" if 5000 * n == y

  n10000 = min(n, y / 10_000)
  n5000 = min(n, y / 5000)

  n10000.downto(0) do |i|
    (n5000 - i).downto(0) do |j|
      k = n - i - j
      return "#{i} #{j} #{k}" if i * 10_000 + j * 5000 + k * 1000 == y
    end
  end

  '-1 -1 -1'
end

puts calc(n, y)

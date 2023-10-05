_l, n1, _n2 = gets.split.map(&:to_i)
l1 = [] # 1st line
l2 = [] # 2nd line
count = 0

n1.times do
  l1 << gets.split.map(&:to_i)
end

while line = gets
  l2 << line.split.map(&:to_i)
end

class Array
  def present?
    !self.empty?
  end
end

def min(a, b)
  a < b ? a : b
end

while l1.present? && l2.present?
  w = min(l1.first.last, l2.first.last)
  count += w if l1.first.first == l2.first.first

  l1.first[1] -= w
  l1.shift if l1.first.last.zero?

  l2.first[1] -= w
  l2.shift if l2.first.last.zero?
end

puts count

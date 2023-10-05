n, _m, k = gets.split.map(&:to_i)

# 濃度計算
def conc(x, y)
  x / (x + y).to_f
end

water_a = []
# 高橋くん
n.times do |i|
  a, b = gets.split.map(&:to_i)
  water_a << [a, b]
end
water_a.sort_by! { |(a, b)| conc(a, b) }

ranks = []

while line = gets
  (c, d) = line.split.map(&:to_i)
  water_a.each do |(a, b)|
    q = conc(a + c, b + d)
    if ranks.size < k
      ranks << q
      ranks.sort!.reverse! if ranks.size == k
    else
      break if ranks.last > q
      ranks.pop
      ranks.push(q)
      ranks.sort!.reverse!
    end
  end
end

puts ranks.last * 100.0

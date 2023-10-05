n = gets.to_i
scores = gets.chomp.split.map(&:to_i).sort

# 下からN人
scores.shift(n)

# 上からN人
scores.pop(n)

puts scores.sum(0.0) / scores.size

s = gets.chomp.chars

count = 0

memo = Hash.new(false)

pattern = [%w[1 1], %w[2 2], %w[3 3], %w[4 4], %w[5 5], %w[6 6], %w[7 7], %w[8 8], %w[9 9], %w[0 0]]
pattern.each do |p|
  memo[p] = true
end

pattern.combination(2).each do |p|
  memo[p[0] + p[1]] = true
end

s.length.times do |i|
  ((s.length - i)/ 2).times do |j|
    l = (j + 1) * 2
    n = s.slice(i, l)

    if memo[n]
      count += 1
      next
    end

    n = n.sort
    if memo[n]
      count += 1
      next
    end

    if n.each_slice(2).all? { |a, b| a == b }
      count += 1
      memo[n] = true
    else
      memo[n] = false
    end
  end
end

puts count

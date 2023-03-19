n = gets.to_i
memo = Array.new(n+1, 0)

(1..n).each do |i|
  
end

def count(num)
  result = 0
  memo = Hash.new

  (1..num).each do |i|
    x = memo[i] ||= divisor(i)
    y = memo[num - i] ||= divisor(num - i)
    result += x * y
  end

  result
end

puts count(n)

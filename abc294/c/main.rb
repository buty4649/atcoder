n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

result_a = []
result_b = []

(1..(n+m)).each do |i|
  if a.empty?
    result_b << i
  elsif b.empty?
    result_a << i
  elsif a.first < b.first
    result_a << i
    a.shift
  else
    result_b << i
    b.shift
  end
end

puts result_a.join(' ')
puts result_b.join(' ')

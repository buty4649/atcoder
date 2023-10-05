n = gets.to_i

login = Hash.new(0)

while input = gets&.chomp
  a, b = input.split.map(&:to_i)
  login[a] += 1
  login[a + b - 1] -= 1
end

user = 0
answer = [0] * (n + 1)
(1..1000).each do |i|
  user += login[i]
  answer[user] += 1
end

puts answer[1..].join(" ")

# frozen_string_literal: true

n = gets.to_i
s = gets.chomp
t = gets.chomp

result = n.times.all? do |i|
  s[i] == t[i] ||
    s[i] == '1' && t[i] == 'l' ||
    s[i] == 'l' && t[i] == '1' ||
    s[i] == '0' && t[i] == 'o' ||
    s[i] == 'o' && t[i] == '0'
end

puts result ? 'Yes' : 'No'

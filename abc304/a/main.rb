# frozen_string_literal: true

n = gets.to_i

min = -1
min_index = 0

s = n.times.map do |index|
  name, age = gets.chomp.split
  age = age.to_i

  if min == -1 || age < min
    min = age
    min_index = index
  end

  name
end

puts s[min_index..].join("\n")
puts s[0...min_index].join("\n")

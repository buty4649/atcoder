# frozen_string_literal: true

n, x = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

def calc(a)
  a.sort[1..-2].sum
end

101.times do |i|
  score = calc(a + [i])
  if score >= x
    puts(i)
    exit
  end
end

puts(-1)

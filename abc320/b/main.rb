# frozen_string_literal: true

s = gets.chomp

def check(s)
  (2..s.length).map do |i|
    ss = s[0..i - 1]
    next 1 unless (i.odd? && ss[0..i / 2 - 1] == ss[i / 2 + 1..].reverse) ||
                  ss[0..i / 2 - 1] == ss[i / 2..].reverse

    i
  end
end

result = (0...s.length).map do |i|
  check(s[i..])
end

puts result.flatten.max

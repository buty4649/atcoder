# frozen_string_literal: true

k = gets.to_i

def is_321number?(n)
  return true if n.positive? && n <= 9

  while n >= 10
    n1 = n % 10
    n /= 10
    n2 = n % 10
    return false if n2 <= n1
  end

  true
end

i = 0

while k.positive?
  i += 1
  i += 1 until is_321number?(i)
  k -= 1
end

puts i

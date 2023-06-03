# frozen_string_literal: true

n = gets.to_i

if n < 10**3 - 1
  puts n
elsif n < 10**4 - 1
  puts(n / 10 * 10)
elsif n < 10**5 - 1
  puts(n / 100 * 100)
elsif n < 10**6 - 1
  puts(n / 1000 * 1000)
elsif n < 10**7 - 1
  puts(n / 10_000 * 10_000)
elsif n < 10**8 - 1
  puts(n / 100_000 * 100_000)
else
  puts(n / 1_000_000 * 1_000_000)
end

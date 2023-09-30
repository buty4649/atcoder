# frozen_string_literal: true

n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

i = 0
n.times do |day|
  day += 1

  if a[i] == day
    i += 1
    puts 0
  else
    puts(a[i] - day)
  end
end

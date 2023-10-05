# frozen_string_literal: true

_n = gets

before = 0

result = gets.chomp.split.each_with_object([]) do |a, obj|
  a = a.to_i

  if before.positive? && (a - before).abs > 1
    s, e = a > before ? [before, a] : [a, before]
    ary = ((s + 1)..(e - 1)).to_a
    ary.reverse! if a < before
    obj.concat(ary)
  end

  obj << a
  before = a
  obj
end

puts result.join(' ')

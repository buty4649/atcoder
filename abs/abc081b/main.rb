# frozen_string_literal: true
_n = gets
a = gets.split.map(&:to_i)

class Array
  def all_even?
    self.all?(&:even?)
  end
end

count = 0

while a.all_even?
  a = a.map { |x| x / 2 }
  count += 1
end

puts count

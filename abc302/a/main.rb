# frozen_string_literal: true

a, b = gets.split.map(&:to_i)

answer = (a / b)
answer += a % b == 0 ? 0 : 1
puts answer

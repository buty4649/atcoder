# frozen_string_literal: true

n, d = gets.split.map(&:to_i)

# 座標
class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def length(other)
    Math.sqrt((@x - other.x)**2 + (@y - other.y)**2)
  end
end

points = n.times.map do
  x, y = gets.split.map(&:to_i)
  Point.new(x, y)
end

answer = [false] * n

def check(n, d, i, point, answer)
  # 終わり
  return if answer[i].nil? || answer[i]

  # 感染した
  answer[i] = true

  # 感染した人を見つける
  n.times do |j|
    # 同じ人
    next if i == j
    next unless point[i].length(point[j]) <= d

    check(n, d, j, point, answer)
  end
end

check(n, d, 0, points, answer)

answer.each do |a|
  puts a ? 'Yes' : 'No'
end

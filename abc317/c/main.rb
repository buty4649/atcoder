# frozen_string_literal: true

n,m = gets.split.map(&:to_i)

map = Array.new(11) { Array.new(11, 0) }
m.times do
  a,b,c = gets.split.map(&:to_i)
  map[a][b] = c
  map[b][a] = c
end

class Resolver
  def initialize(map)
    @map = map
    @answer = 0
    @check = [false] * 11
  end

  def answer
    (1..10).each do |i|
      resolv(i, 0)
    end
    @answer
  end

  def resolv(town, cost)
    @answer = cost if cost > @answer

    @check[town] = true
    (1..10).each do |i|
      next if @check[i] || @map[town][i] == 0

      resolv(i, cost + @map[town][i])
    end
    @check[town] = false
  end
end

puts Resolver.new(map).answer

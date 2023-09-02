# frozen_string_literal: true

n,m = gets.split.map(&:to_i)

map = {}
m.times do
  a,b,c = gets.split.map(&:to_i)
  map[a] ||= {}
  map[a][b] = c
  map[b] ||= {}
  map[b][a] = c
end

class Resolver
  def initialize(map)
    @map = map
    @cache = {}
  end

  def answer
    @map.keys.map do |town|
      resolv(town, 0, 0)
    end.max
  end

  def resolv(town, cost, check_bit)
    # キャッシュにあればそれを返す
    check_bit |= 1 << town
    return @cache.dig(town, check_bit) if @cache.dig(town, check_bit)

    max_cost = @map[town].map do |(dest, dest_cost)|
      next cost if check_bit[dest].positive?

      resolv(dest, cost + dest_cost, check_bit)
    end.max
    @cache[town] ||= {}
    @cache[town][check_bit] = max_cost
  end
end

puts Resolver.new(map).answer

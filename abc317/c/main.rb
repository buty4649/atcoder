# frozen_string_literal: true

n,m = gets.split.map(&:to_i)

map = {}
m.times do
  a,b,c = gets.split.map(&:to_i)
  map[a] ||= []
  map[a] << {next: b, cost: c}

  # 逆方向
  map[b] ||= []
  map[b] << {next: a, cost: c}
end

def resolv(town, cost, map, check)
  return cost unless map[town]

  check[town] = true
  map[town].map do |m|
    next cost if check[m[:next]]
    resolv(m[:next], cost + m[:cost], map, check.dup)
  end.max
end

cache = {}

answer = map.keys.map do |town|
  cache[town] ||= {}
  map[town].map do |m|
    next cache[town][m[:next]] if cache[town][m[:next]]
    check = {}
    check[town] = true
    check[m[:next]] = true
    cache[town][m[:next]] = resolv(m[:next], m[:cost], map, check)
  end.max
end.max

puts answer

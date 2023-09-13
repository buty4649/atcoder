#!/usr/bin/env ruby

n = STDIN.gets.to_i

class Pair

  def self.get(n)
    n.even? ? n - 1 : n + 1
  end

end

puts Pair.get(n)

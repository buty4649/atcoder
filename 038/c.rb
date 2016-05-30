#!/usr/bin/env ruby

n = STDIN.gets.to_i
seq = STDIN.gets.split.map(&:to_i)

class Monotonicity

  def self.pattern(n, seq)
    count = 0
    (0...n-1).each do |i|
      (i+1..n-1).each do |j|
        if seq[j] - seq[j-1] >= 1
          count += 1
        else
          break
        end
      end
    end
    count + n
  end
end

puts Monotonicity.pattern(n, seq)

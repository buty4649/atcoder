#!/usr/bin/env ruby

s = STDIN.gets.chomp

class Tea

  def self.check(s)
    s.slice(-1) == "T" ? "YES" : "NO"
  end
end

puts Tea.check(s)

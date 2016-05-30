#!/usr/bin/env ruby

display1 = STDIN.gets.split.map(&:to_i)
display2 = STDIN.gets.split.map(&:to_i)

class DualDisplay

  def self.check(display1, display2)
    (display1 & display2).length > 0 ? "YES" : "NO"
  end
end

puts DualDisplay.check(display1, display2)

#!/usr/bin/env ruby

x, y = STDIN.gets.split.map{|n| n.to_i}

class TestScore

  def self.check(x, y)
    case
    when x < y then "Better"
    when x > y then "Worse"
    else
      raise "Input Error"
    end
  end

end

puts TestScore.check(x, y)

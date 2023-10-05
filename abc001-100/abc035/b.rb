#!/usr/bin/env ruby

s = STDIN.gets
t = STDIN.gets

class Drone
  def self.exec(s, t)
    count_l = s.count("L")
    count_r = s.count("R")
    count_u = s.count("U")
    count_d = s.count("D")
    distance = (count_l - count_r).abs + (count_u - count_d).abs

    count_hatena = s.count("?")
    if t.to_i == 1
      distance + count_hatena
    else
      if distance >= count_hatena
        distance - count_hatena
      else
        if (distance - count_hatena).abs.even?
          0
        else
          1
        end
      end
    end
  end
end

puts Drone.exec(s, t)

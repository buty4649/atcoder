#!/usr/bin/env ruby

s = STDIN.gets
t = STDIN.gets

class Drone
  def self.exec(s, t)
    x = y = hatena = 0
    s.split(//).each do |c|
      case c
      when 'L' then x -= 1
      when 'R' then x += 1
      when 'U' then y += 1
      when 'D' then y -= 1
      when '?' then hatena += 1
      end
    end

    distance = x.abs + y.abs

    if t.to_i == 1
      distance + hatena
    else
      if distance >= hatena
        distance - hatena
      else
        if (distance - hatena) % 2 == 0
          0
        else
          1
        end
      end
    end
  end
end

puts Drone.exec(s, t)

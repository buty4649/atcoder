#!/usr/bin/env ruby

w,h = STDIN.gets.split.map{|n| n.to_i}

class Aspect
  def self.ratio(w, h)
    gcd = w.gcd(h)
    "#{w/gcd}:#{h/gcd}"
  end
end

puts Aspect.ratio(w, h)

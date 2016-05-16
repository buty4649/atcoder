#!/usr/bin/env ruby

w,h = STDIN.gets.split.map{|n| n.to_i}

class Aspect
  def initialize(w, h)
    raise "invalide wide #{w}"   if h > w || w > 100000
    raise "invalide height #{h}" if h < 1

    @w = w
    @h = h
  end

  def aspect
    if @w % 16 == 0 && @h % 9 == 0
      "16:9"
    else
      "4:3"
    end
  end
end

a = Aspect.new(w,h)
puts a.aspect

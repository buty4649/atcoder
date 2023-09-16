# frozen_string_literal: true

class Resolver
  def initialize
    @m = gets.to_i
    @s1 = gets.chomp.chars
    @s2 = gets.chomp.chars
    @s3 = gets.chomp.chars
  end

  def answer
    return -1 if hits.empty?

    @hits.map do |c|
      [
        all_stop(1, 2, 3, c),
        all_stop(1, 3, 2, c),
        all_stop(2, 3, 1, c),
        all_stop(2, 1, 3, c),
        all_stop(3, 1, 2, c),
        all_stop(3, 2, 1, c)
      ]
    end.flatten.min
  end

  # 揃う目の一覧
  def hits
    @hits ||= @s1.uniq.select do |c|
      @s2.include?(c) && @s3.include?(c)
    end
  end

  # nリールにおいてt秒以降にcが止まるには何秒かかるか
  def stop(n, t, c)
    s = case n
        when 1 then @s1
        when 2 then @s2
        when 3 then @s3
        end

    tt = t % @m
    if s[tt..].include?(c)
      t + s[tt..].index(c)
    else
      # 一回転が必要
      t + @m - tt + s.index(c)
    end
  end

  # すべてのリールを止める
  def all_stop(n1, n2, n3, c)
    t1 = stop(n1, 0, c)
    t2 = stop(n2, t1 + 1, c)
    stop(n3, t2 + 1, c)
  end
end

puts Resolver.new.answer

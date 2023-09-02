# frozen_string_literal: true

class Resolver
  def initialize()
    @n = gets.to_i

    # [src, dest] => cost なツリーを作る
    @tree = {}
    (@n - 1).times do |i|
      d = gets.split.map(&:to_i)
      d.each_with_index do |cost, j|
        index = [i + 1, i + 1 + j + 1]
        @tree[index] = cost
      end
    end
  end

  def answer(cost=0, check=0)
    @tree.map do |((src, dest), c)|
      bits = (1 << src) | (1 << dest)
      # すでに選択していたらスキップ
      next cost if check & bits > 0

      answer(cost + c, check | bits)
    end.max
  end
end

puts Resolver.new.answer

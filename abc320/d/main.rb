# frozen_string_literal: true

class Resolver
  def initialize
    @n, @m = gets.split.map(&:to_i)
    @p = Array.new(@n + 1)
    @p[1] = [0, 0]
  end

  def answer
    @m.times do
      a, b, x, y = gets.split.map(&:to_i)

      next if @p[a].nil? && @p[b].nil?

      if @p[a].nil?
        a, b = [b, a]
        x = -x
        y = -y
      end

      @p[b] = [@p[a][0] + x, @p[a][1] + y]
    end

    @p[1..].map do |pp|
      pp ? pp.join(' ') : 'undecidable'
    end.join("\n")
  end
end

puts Resolver.new.answer

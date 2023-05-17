# frozen_string_literal: true

# A の L 番目から R 番目までの要素を反転してできる順列
class F
  include Comparable

  attr_reader :ary

  # LとRは0-indexed
  def initialize(a, l, r)
    @ary = []
    @ary += a[0...l]
    @ary += a[l..r].reverse
    @ary += a[r + 1..]
  end

  def to_s
    @ary.join(' ')
  end

  def <=>(other)
    @ary.size.times do |i|
      next if @ary[i] == other.ary[i]

      return @ary[i] <=> other.ary[i]
    end
  end
end

n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

result = []
n.times do |i|
  (i...n).each do |j|
    result << F.new(a, i, j)
  end
end

puts result.sort[k - 1]

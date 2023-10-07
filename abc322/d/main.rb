# frozen_string_literal: true

class Field
  def initialize
    @field = [0, 0, 0, 0]
  end

  def put(block)
    check = 4.times.all? { |i| (@field[i] & block.block[i]).zero? }
    return unless check

    @field[0] |= block.block[0]
    @field[1] |= block.block[1]
    @field[2] |= block.block[2]
    @field[3] |= block.block[3]
  end

  def fill?
    @field[0] == 0xb1111 &&
      @field[1] == 0xb1111 &&
      @field[2] == 0xb1111 &&
      @field[3] == 0xb1111
  end
end

class Block
  attr_reader :block

  def initialize(block = nil)
    if block
      @block = block
    else
      @block = gets_block
      align
    end
  end

  def align
    while @block[0].zero?
      @block[0] = @block[1]
      @block[1] = @block[2]
      @block[3] = 0
    end

    while ((@block[0] | @block[1] | @block[2] | @block[3]) & 0b0001).zero?
      @block[0] >>= 1
      @block[1] >>= 1
      @block[2] >>= 1
      @block[3] >>= 1
    end

    self
  end

  def shift_top
    return unless @block[0].zero?

    Block.new([
                @block[1],
                @block[2],
                @block[3],
                0
              ])
  end

  def shift_bottom
    return unless @block[3].zero?

    Block.new([
                0,
                @block[0],
                @block[1],
                @block[2]
              ])
  end

  def shift_right
    return unless ((@block[0] | @block[1] | @block[2] | @block[3]) & 0b1000).zero?

    Block.new([
                @block[0] << 1,
                @block[1] << 1,
                @block[2] << 1,
                @block[3] << 1
              ])
  end

  def shift_left
    return unless ((@block[0] | @block[1] | @block[2] | @block[3]) & 0b0001).zero?

    Block.new([
                @block[0] >> 1,
                @block[1] >> 1,
                @block[2] >> 1,
                @block[3] >> 1
              ])
  end

  def gets_block
    # 左上を(0,0)にする
    4.times.map do
      # .を0, #を1として2進数に変換する
      gets.chomp.gsub('.', '0').gsub('#', '1').reverse.to_i(2)
    end
  end

  def rotate
    result = []
    result[0] =
      ((@block[0] & 0b0001) << 3) | ((@block[1] & 0b0001) << 2) | ((@block[2] & 0b0001) << 1) | (@block[3] & 0b0001)
    result[1] =
      ((@block[0] & 0b0010) << 2) | ((@block[1] & 0b0010) << 1) | (@block[2] & 0b0010) | ((@block[3] & 0b0010) >> 1)
    result[2] =
      ((@block[0] & 0b0100) << 1) | (@block[1] & 0b0100) | ((@block[2] & 0b0100) >> 1) | ((@block[3] & 0b0100) >> 2)
    result[3] =
      (@block[0] & 0b1000) | ((@block[1] & 0b1000) >> 1) | ((@block[2] & 0b1000) >> 2) | ((@block[3] & 0b1000) >> 3)
    Block.new(result).align
  end

  def to_s
    @block.map { |b| format('%04b', b).reverse }.join("\n")
  end

  def dup
    Block.new(@block.dup)
  end
end

class Resolver
  def initialize
    @blocks = 3.times.map do
      block = Block.new
      b1 = block.rotate
      b2 = b1.rotate
      b3 = b2.rotate
      [block, b1, b2, b3]
    end
  end

  def answer
    # 左上から埋めていく
    3.times do |i| # blockの種類
      4.times do |j| # 回転した回数
        filed = Field.new
      end
    end
  end

  def resolv(filed, bits, )
end

puts Resolver.new.answer

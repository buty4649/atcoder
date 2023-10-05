# frozen_string_literal: true

require 'set'

n = gets.to_i
_q = gets.to_i

box = [] # 箱
nindex = {} # 数が入っている箱の番号

while line = gets&.chomp
  (query, i, j) = line.split.map(&:to_i)

  case query
  when 1
    # 数iを箱jを入れる
    box[j] ||= []
    box[j] << i

    # indexしておく
    nindex[i] ||= Set.new
    nindex[i] << j
  when 2
    puts box[i].sort.join(' ')
  when 3
    puts nindex[i].to_a.sort.join(' ')
  end
end

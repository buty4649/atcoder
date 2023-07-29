# frozen_string_literal: true

n, m = gets.split.map(&:to_i)

data = n.times.map do
  # #を1、.を0として、2進数に変換する
  # ただし左側を0にしたいのでreverseしている
  gets.chomp.reverse.tr('#.', '10').to_i(2)
end

# pp data.map { |d| d.to_s(2).reverse.ljust(m, '0') }

def match?(data, i, j)
  # 左上三行の検索111があるなら&を取れるはず
  # また最上位ビットは0(白マス)でなければならない
  data[i] & data[i+1] & data[i+2] & (0b1111 << j) == (0b111 << j) &&

  # 白マスチェック
  data[i+3] & (0b1111 << j) == 0 &&
  data[i+5] & (0b1111 << (j+5)) == 0 &&

  # 右下三行の検索
  data[i+6] & data[i+7] & data[i+8] & (0b1111 << (j+5)) == (0b111 << (j+6))
end

# 条件を検索していく
(n-8).times do |i|
  (m-8).times do |j|
    next unless match?(data, i, j)

    puts "#{i+1} #{j+1}"
  end
end

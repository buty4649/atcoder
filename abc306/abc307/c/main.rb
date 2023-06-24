# frozen_string_literal: true

def parse(h)
  # 左上から0,0とし、最初と最後の0を削除しておく
  result = h.times.map { gets.chomp.reverse }

  # 左に詰めつつ２進数にする
  shift = result.map { |r| r.index('#') || h }.min
  result.map { |r| r[shift..].gsub('#', '1').gsub('.', '0').to_i(2) }
        .drop_while(&:zero?) # 縦列の最初の0を削除
        .reverse.drop_while(&:zero?).reverse # 縦列の最後の0を削除
end

ha, _wa = gets.split.map(&:to_i)
a = parse(ha)

hb, _wb = gets.split.map(&:to_i)
b = parse(hb)

hx, wx = gets.split.map(&:to_i)
x = parse(hx)

def match?(a, b, x, ia, ja, ib, jb)
  x.each_with_index do |xr, i|
    aa = (a[ia + i] || 0) << ja
    bb = (b[ib + i] || 0) << jb
    return false unless (xr ^ (aa | bb)).zero?
  end
  true
end

# aを縦に移動
(hx + 1).times do |ia|
  # bを縦に移動
  (hx + 1).times do |ib|
    # aを横に移動
    (wx + 1).times do |ja|
      # bを横に移動
      (wx + 1).times do |jb|
        next unless match?(a, b, x, ia, ja, ib, jb)

        puts 'Yes'
        exit
      end
    end
  end
end

puts 'No'

# frozen_string_literal: true

m = 998_244_353
_q = gets

s = [1]
n = 1
i = 0

while line = gets&.chomp
  (q, x) = line.split.map(&:to_i)
  case q
  when 1
    # 末尾に追加=10倍して足す
    s << x
    n = ((n * 10) + x) % m
  when 2
    # 先頭の数字を削除(=桁数を減らす)
    n = (n - s[i].to_i * 10.pow(s.size - i - 1, m)) % m
    i += 1
  when 3
    puts n
  end
end

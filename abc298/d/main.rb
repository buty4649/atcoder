# frozen_string_literal: false

_q = gets

s = 1
d = 1

while line = gets&.chomp
  (q, x) = line.split
  case q
  when '1'
    # 末尾に追加
    s << x
  when '2'
    # 先頭の数字を削除
    t += 1
  when '3'
    n = s[t..].to_i
    puts n % 998_244_353
  end
end

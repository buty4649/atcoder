# frozen_string_literal: true

n = gets.to_i

# 5の倍数にまるめ
m = n / 5 * 5

# 5小さい方と5多いほうで近い方を出力
if (m - n).abs > (m + 5 - n).abs
  puts m + 5
else
  puts m
end

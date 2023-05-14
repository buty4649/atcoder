# frozen_string_literal: true

# 1文字ごとの登場数をHashにする
def s2hash(s)
  s.chars.each_with_object(Hash.new(0)) { |c, obj| obj[c] += 1 }
end

s = s2hash(gets.chomp)
t = s2hash(gets.chomp)

# @の数を計算
atmark = (s.delete('@') || 0) + (t.delete('@') || 0)

# 残りの文字の個数の差を計算
diff = {}
s.each do |k, v|
  tk = t.delete(k) || 0

  # 差があるときはメモ
  diff[k] = (v - tk).abs if v != tk
end

# tの残りを合算
diff.merge!(t)
delta = diff.values.sum

# 敗北条件
# * 差分の文字がatcoderに含まれない
# * 差分の数より@のほうが少ない
# * 差分の数と@の数の差が奇数
#   - ※差分の数と@の数が一緒の場合は勝利
if diff.keys.any? { |k| !%w[a t c o d e r].include?(k) } ||
   delta > atmark ||
   (delta - atmark).abs.odd?
  puts 'No'
else
  puts 'Yes'
end

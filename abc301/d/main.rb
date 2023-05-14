# frozen_string_literal: true

s = gets.chomp
n = gets.to_i

# ?を0に置き換えて最小値を計算しておく
answer = s.gsub('?', '0').to_i(2)

# 最小値がnを超えていたら-1
if answer > n
  puts '-1'
  exit
end

# ?を0に置き換えながらn未満の最大値を探す
loop do
  answer = s.gsub('?', '1').to_i(2)
  if answer <= n
    puts answer
    break
  end

  # 先頭の?を0に変えて次へ
  s.sub!('?', '0')
end

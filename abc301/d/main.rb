# frozen_string_literal: true

s = gets.chomp
n = gets.to_i

# ?を1に置き換えながら最大値を探す
while s.index('?')
  # 先頭だけ1にしてみてnを超えていないか判定
  if s.sub('?', '1').gsub('?', '0').to_i(2) > n
    # 超えていたら0
    s.sub!('?', '0')
  else
    # 超えていなかったら1
    s.sub!('?', '1')
  end
end

answer = s.to_i(2)
puts answer > n ? '-1' : answer

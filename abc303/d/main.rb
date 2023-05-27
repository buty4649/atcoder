# frozen_string_literal: true

x, y, z = gets.split.map(&:to_i)
s = gets.chomp.chars

# 連続した文字をまとめる
Char = Struct.new(:c, :n)
keys = []

s.each do |c|
  if keys.last&.c == c
    keys.last.n += 1
  else
    keys << Char.new(c, 1)
  end
end

current = 'a'
result = keys.each_with_index.sum do |(k, index)|
  if current == k.c
    # Xが良いかZ+が良いか
    score_x = x * k.n
    score_z = z + (k.n * y)
    if score_x == score_z
      # 同じ場合は次の値を見る
      if nkey = keys[index + 1]
        # Xのほうが少ない: いまいまはXを押したほうがよい
        # Yのほうが少ない: いまいまはZを押したほうがよい
        if x * nkey.n < y * nkey.n
          score_x
        else
          current = current == 'a' ? 'A' : 'a'
          score_z
        end
      end
    elsif score_x < score_z
      score_x
    else
      current = current == 'a' ? 'A' : 'a'
      score_z
    end
  else
    score_y = y * k.n
    score_z = z + (k.n * x)
    if score_y == score_z
      # 同じ場合は次の値を見る
      if nkey = keys[index + 1]
        # Xのほうが少ない: いまいまはZを押したほうがよい
        # Yのほうが少ない: いまいまはYを押したほうがよい
        if x * nkey.n < y * nkey.n
          current = current == 'a' ? 'A' : 'a'
          score_z
        else
          score_y
        end
      else
        # 最後だったのでどちらでもよい
        score_y
      end
    elsif score_y < score_z
      # Y回操作したほうが早い
      score_y
    else
      # Z操作してX回操作する
      current = current == 'a' ? 'A' : 'a'
      score_z
    end
  end
end

puts result

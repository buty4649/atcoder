# frozen_string_literal: true

n = gets.to_i

wins = 0 # 勝っている議席数
loses = 0 # 負けている議席数
data = []

n.times do
  x,y,z = gets.split.map(&:to_i)

  # 青木君(x)が勝っている
  if x > y
    wins += z
  else
    loses += z
    data << [x, y, z]
  end
end

# 青木君が勝っている議席数が多いなら0人で終わり
if wins > loses
  puts 0
  exit
end

# 寝返る人数と議席数をマップする
list = data.map do |(x, y, z)|
  [((y + x) * 0.5).ceil - x, z]
end.sort_by{ |(_, z)| z }.reverse

needs = (loses - wins) # 必要な議席数

answer = 0
list.each do |(n, z)|
  needs -= z
  answer += n
  if needs <= 0
    puts answer
    exit
  end
end

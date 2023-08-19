# frozen_string_literal: true

n = gets.to_i

# flavorごとにHASHを作ってその中の最大値を保存しておく
icecreams = Hash.new
n.times do
  flavor, score = gets.split.map(&:to_i)
  icecreams[flavor] ||= []
  icecreams[flavor] << score
end

# 同じフレーバーを選んだときの最大値を見つける
same_flavor_max = icecreams.values.inject(0) do |result, scores|
  next result if scores.size < 2

  s1, s2 =  scores.sort.reverse[0..1]
  [result, s1 + s2/2].max
end

# 異なるフレーバーを選んだときの最大値を見つける
diff_flavor_max = icecreams.map {|_, s| s.max }.sort.reverse[0..1].sum

puts [same_flavor_max, diff_flavor_max].max

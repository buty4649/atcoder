# frozen_string_literal: true

Food = Struct.new(:poison, :score) do
  def self.gets
    p, s = $stdin.gets.split.map(&:to_i)
    new(p, s)
  end
end

n = gets.to_i

# 毒の状態とスコアを取得
# 0: 毒ではない
# 1: 毒
dp = []
dp[0] = [0, 0]

n.times do |i|
  f = Food.gets

  dp[i + 1] = if f.poison.zero?
                # 解毒剤
                [
                  [
                    dp[i][0], # 食べない
                    dp[i][0] + f.score, dp[i][1] + f.score # 食べる
                  ].max,
                  dp[i][1] # 食べない
                ]
              else
                # 毒
                [
                  dp[i][0], # 食べない
                  [
                    dp[i][0] + f.score, # 食べる
                    dp[i][1] # 食べない
                  ].max
                ]
              end
end

puts [
  dp.last[0],
  dp.last[1]
].max

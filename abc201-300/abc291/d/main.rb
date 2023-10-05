MOD = 998244353

gets # N

def inputs
  return unless line = gets

  line.chomp.split.map(&:to_i)
end

# 0: 表, 1: 裏
prev_dp = [1, 1]

prev_cards = inputs
while next_cards = inputs
  next_dp = [0, 0]
  if prev_dp[0] > 0
    next_dp[0] += next_cards[0] != prev_cards[0] ? prev_dp[0] : 0
    next_dp[0] += next_cards[0] != prev_cards[1] ? prev_dp[1] : 0
  end

  if prev_dp[1] > 0
    next_dp[1] += next_cards[1] != prev_cards[0] ? prev_dp[0] : 0
    next_dp[1] += next_cards[1] != prev_cards[1] ? prev_dp[1] : 0
  end

  prev_cards = next_cards
  prev_dp = next_dp
end

puts (prev_dp.sum) % MOD

# frozen_string_literal: true

h, = gets.split.map(&:to_i)

# とりあえず全行読み込む
s = h.times.map { gets.chomp }

# 長方形の幅と開始位置を見つける
def find_rect(s)
  width = 0
  pos = 501
  s.each do |ss|
    next unless ss =~ /^\.*#+\.*$/

    # . を削除して幅を取得
    width = [width, ss.delete('.').length].max

    # # の位置を取得
    pos = [pos, ss.index('#')].min
  end
  [width, pos]
end
w, p = find_rect(s)

# 次に#が含まれてw未満の行を見つける
h.times do |i|
  c = s[i].count('#')
  next if c.zero? || c == w

  # p以降で.が始まる位置を見つける
  j = s[i][p..].index('.')

  # 1-indexed
  puts [i + 1, j + p + 1].join(' ')
  exit
end

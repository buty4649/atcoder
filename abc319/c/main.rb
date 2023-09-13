# frozen_string_literal: true

c = 3.times.map do |_i|
  gets.chomp.split.map(&:to_i)
end

# 全パターン試す
# わかりやすいように1-indexedにする
[
  # 横の列
  %w[1,1 1,2 1,3],
  %w[2,1 2,2 2,3],
  %w[3,1 3,2 3,3],

  # 縦の列
  %w[1,1 2,1 3,1],
  %w[1,2 2,2 3,2],
  %w[1,3 2,3 3,3]
]

# frozen_string_literal: true

h, _w = gets.split.map(&:to_i)
s = h.times.map { gets.chomp.chars }

# v : 縦方向の変化量
# h : 横方向の変化量
def search(s, i, j, v, h)
  word = %w[s n u k e]

  result = 5.times.all? do |c|
    ii = i + (v * c)
    jj = j + (h * c)
    ii >= 0 && jj >= 0 && s[ii] && s[ii][jj] == word[c]
  end

  return unless result

  5.times.map do |c|
    ii = i + (v * c)
    jj = j + (h * c)
    [ii + 1, jj + 1] # 答えは1-indexed
  end
end

# まずはsを見つける
h.times.find do |i|
  while (j = s[i].index('s'))
    # 横方向に探す
    answer = search(s, i, j, 0, 1) ||
             search(s, i, j, 0, -1) ||

             # 縦方向に探す
             search(s, i, j, 1, 0) ||
             search(s, i, j, -1, 0) ||

             # 斜め方向に探す
             search(s, i, j, 1, 1) ||
             search(s, i, j, 1, -1) ||
             search(s, i, j, -1, 1) ||
             search(s, i, j, -1, -1)

    s[i][j] = ''
    next unless answer

    answer.each do |a|
      puts a.join(' ')
    end
    exit
  end
end

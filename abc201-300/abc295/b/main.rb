r, c = gets.split.map(&:to_i)

bomb = [] # ボムの位置
map = []  # マップ

r.times.each_with_index do |i|
  input = gets.chomp.chars

  # ボムの位置を把握
  map << []
  input.each_with_index do |c, j|
    if c == '.' || c == '#'
      map[-1] << c
    else
      bomb << [c.to_i, i, j]
      map[-1] << '.'
    end
  end
end

bomb.each do |(power, i, j)|
  (i - power .. i + power).each do |k|
    next if k < 0
    break if k >= r

    (j - power .. j + power).each do |l|
      next if l < 0
      break if l >= c

      if (k - i).abs + (l - j).abs <= power
        map[k][l] = '.'
      end
    end
  end
end

puts map.map(&:join).join("\n")

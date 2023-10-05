# frozen_string_literal: true

_n = gets

s = gets.chomp

t = s.count('T')
a = s.count('A')

if t == a
  # 引き分けなので最後の文字を見て判定
  if s[-1] == 'T'
    puts 'A'
  else
    puts 'T'
  end
elsif t > a
  puts 'T'
else
  puts 'A'
end

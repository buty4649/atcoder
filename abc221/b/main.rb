t = gets.chomp
s = gets.chomp

if t == s
  puts "Yes"
  exit
end

t.length.times do |i|
  next if t[i] == s[i]

  # 今の文字と次の文字を入れ替えてみる
  temp = s.dup
  temp[i] = s[i+1]
  temp[i+1] = s[i]

  if t == temp
    puts "Yes"
    break
  else
    puts "No"
    break
  end
end

n = gets.to_i
s = gets.chomp

(1..(n-1)).each do |i|
  (1..n).each do |j|
    if i + j > n || s[j-1] == s[j+i-1]
      puts j-1
      break
    end
  end
end

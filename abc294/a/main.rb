_n = gets

puts gets.chomp.split.map(&:to_i).select {|n| n.even? }.join(" ")

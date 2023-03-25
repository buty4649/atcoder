n = gets.to_i

colors = Hash.new(0)

gets.split.map(&:to_i).each do |c|
  colors[c] += 1
end

puts colors.values.sum {|c| c / 2}

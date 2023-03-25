_nm = gets
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
c = (a + b).sort.each_with_index.to_h

puts a.map{|aa| c[aa] + 1}.join(" ")
puts b.map{|bb| c[bb] + 1}.join(" ")

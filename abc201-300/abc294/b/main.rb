_h, _w = gets.split

def ascii_puts(str)
  puts str.map {|s| if s.zero? then "." else (64 +s).chr end}.join
end

while line = gets&.split&.map(&:to_i)
  ascii_puts(line)
end

# frozen_string_literal: true

_h, _w = gets.split.map(&:to_i)

while line = gets&.chomp
  puts line.gsub(/TT/, 'PC')
end

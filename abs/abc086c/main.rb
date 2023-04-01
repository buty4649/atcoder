# frozen_string_literal: true

_n = gets

prev_x = 0
prev_y = 0
prev_t = 0

while line = gets
  t, x, y = line.split.map(&:to_i)

  distance = (x - prev_x).abs + (y - prev_y).abs
  time = t - prev_t

  # pp [distance, time]

  if distance > time || distance != time && (distance - time).abs.odd?
    puts 'No'
    exit
  end

  prev_x = x
  prev_y = y
  prev_t = t
end

puts 'Yes'

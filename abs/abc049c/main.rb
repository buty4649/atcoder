# frozen_string_literal: true

s = gets.chomp

def calc(s)
  return true if s.empty?
  return if s.size < 5

  %w[
    dreamer
    dream
    eraser
    erase
  ].each do |word|
    next unless s.start_with?(word)

    c = calc(s.delete_prefix(word))
    return c if c
  end

  nil
end

puts calc(s).nil? ? 'NO' : 'YES'

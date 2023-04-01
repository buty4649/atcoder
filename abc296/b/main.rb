# frozen_string_literal: true

8.times do |row|
  if i = gets.index('*')
    puts "#{(97 + i).chr}#{8 - row}"
    exit
  end
end

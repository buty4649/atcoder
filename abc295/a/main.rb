_n = gets
words = gets.split
puts words.any? { |w| %w[and not that the you].include?(w) } ? "Yes" : "No"

# frozen_string_literal: true

s = gets.chomp
w = %w[ACE BDF CEG DFA EGB FAC GBD]
puts w.include?(s) ? 'Yes' : 'No'

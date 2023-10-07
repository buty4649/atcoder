# frozen_string_literal: true

n = gets.to_i
s = n.times.map { gets.count('o') }

result = n.times.group_by { |i| s[i] }
          .sort_by { |k, _| k }
          .reverse
          .map { |_, v| v.sort.map(&:succ).join(' ') } # 1-indexed
          .join(' ')

puts result

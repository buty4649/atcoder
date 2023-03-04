require 'prime'

n = gets.to_i

def count(num)
  memo = Hash.new
  memo[1] = 1

  result = 0
  (1...num).each do |i|
    (1...num).each do |j|
      if i + j == num
        memo[i] = i.prime_division.count unless memo[i]
        memo[j] = j.prime_division.count unless memo[j]

        result += memo[i] + memo[j]
      end
    end
  end

  result
end

puts count(n)

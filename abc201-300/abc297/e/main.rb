# frozen_string_literal: true

n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort

# 累積和を出しておく
csum = a.each_with_object([]) { |x, acc| acc << (acc.last || 0) + x }

s = a.to_h { |x| [x, true] }

2.upto(k / n + 1) do |pow|
  csum.each do |c|
    s[c * pow] = true

    if s.keys.size >= k
      puts s.keys.sort[k - 1]
      exit
    end
  end
end

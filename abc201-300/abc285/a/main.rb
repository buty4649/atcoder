tree = {
  1 => [2, 3],
  2 => [4, 5],
  3 => [6, 7],
  4 => [8, 9],
  5 => [10, 11],
  6 => [12, 13],
  7 => [14, 15],
}

all_tree = tree.each_with_object({}) do |(k, v), r|
  r[k] = [] unless r[k]

  r[k] += v

  v.each do |vv|
    r[vv] = [] unless r[vv]
    r[vv] << k
  end
end

(a, b) = gets.split.map(&:to_i)

if all_tree[a].include?(b)
  puts "Yes"
else
  puts "No"
end

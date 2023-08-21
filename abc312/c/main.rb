# frozen_string_literal: true

n, m = gets.split.map(&:to_i)

# https://aruma256.github.io/blog/2023/08/05/abc312-c.html
events = [] # [代金, 売り手の変化, 買い手の変化]

# seller
gets.chomp.split(/ /).map(&:to_i).each do |x|
  events << [x, 1, 0]
end

# buyer
gets.chomp.split(/ /).map(&:to_i).each do |y|
  events << [y+1, 0, -1]
end

seller = 0
buyer = m

events.sort.each do |event|
  price, seller_change, buyer_change = event
  seller += seller_change
  buyer += buyer_change
  if seller >= buyer
    puts price
    exit
  end
end

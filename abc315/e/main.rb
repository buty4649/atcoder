n = gets.to_i

# 本情報, 0は終端
books = [[]]
n.times do |i|
  indexes = gets.chomp.split(" ").map(&:to_i)
  if indexes.first.zero?
    books[0] << i + 1
  else
    indexes[1..].each do |index|
      books[index] ||= []
      books[index] << i + 1
    end
  end
end

class Resolver
  def initialize
    @answer = []
  end

  def resolve(books, index)
    return @answer if books[index].nil?

    books[index].each do |book|
      @answer << book
      resolve(books, book)
    end
    @answer
  end

  def answer(books)
    resolve(books, 0)
  end
end

puts Resolver.new.answer(books)

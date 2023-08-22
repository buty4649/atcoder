if !ENV['RUBY_THREAD_VM_STACK_SIZE']
    RUBY=Gem.ruby
    exec({'RUBY_THREAD_VM_STACK_SIZE'=>'100000000'},RUBY,$0) #100MB
end

n = gets.to_i
s = Set.new
s << 1

books = n.times.map do |i|
  book = gets.chomp.split(' ').map(&:to_i)[1..]
  next unless s.include?(i+1)
  s += book if book
  [i + 1, book]
end.compact.to_h

require 'tsort'
class Hash
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &block)
    fetch(node).each(&block)
  end
end

answer = books.tsort
answer.delete(1)
puts answer.join(' ')

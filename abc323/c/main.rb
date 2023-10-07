# frozen_string_literal: true

class Resolver
  Player = Struct.new(:score, :answers)

  def initialize
    @n, @m = gets.split.map(&:to_i)
    @scores = gets.split.map(&:to_i)

    @players = @n.times.map do |i|
      p = Player.new(i + 1, [])
      gets.chomp.chars.each_with_index do |c, j|
        next if c == 'x'

        p.score += @scores[j]
        p.answers[j] = true
      end
      p
    end
    @max_score = @players.map(&:score).max
  end

  def answer
    @n.times.map do |i|
      player = @players[i]
      scores = @m.times.map do |j|
        player.answers[j] ? 0 : @scores[j]
      end.sort.reverse
      score = player.score
      count = 0
      while score < @max_score
        score += scores.shift
        count += 1
      end
      count
    end.join("\n")
  end
end

puts Resolver.new.answer

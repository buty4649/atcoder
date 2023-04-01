# frozen_string_literal: true

_n = gets
puts $stdin.read.split("\n").map(&:to_i).sort.uniq.count

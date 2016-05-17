require 'spec_helper'

t = AtCoderTest.new(__FILE__)

describe t.name do
  it {
    expect(t.exec(<<~EOS)).to eq("01010")
    5 4
    1 4
    2 5
    3 3
    1 5
    EOS
  }
  it {
    expect(t.exec(<<~EOS)).to eq("10110000011110000000")
    20 8
    1 8
    4 13
    8 8
    3 18
    5 20
    19 20
    2 7
    4 9
    EOS
  }
end

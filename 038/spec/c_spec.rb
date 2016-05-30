require 'spec_helper'

t = AtCoderTest.new(__FILE__)

describe t.name do
  it { expect(t.exec(<<~EOS)).to eq("8") }
  5
  1 2 3 2 1
  EOS
  it { expect(t.exec(<<~EOS)).to eq("10") }
  4
  1 2 3 4
  EOS
  it { expect(t.exec(<<~EOS)).to eq("8") }
  6
  3 3 4 1 2 2
  EOS
  it { expect(t.exec(<<~EOS)).to eq("10") }
  6
  1 5 2 3 4 2
  EOS
end

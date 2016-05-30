require 'spec_helper'

t = AtCoderTest.new(__FILE__)

describe t.name do
  it { expect(t.exec(<<~EOS)).to eq("YES") }
  1080 1920
  1080 1920
  EOS
  it { expect(t.exec(<<~EOS)).to eq("YES") }
  1080 1920
  1920 1080
  EOS
  it { expect(t.exec(<<~EOS)).to eq("YES") }
  334 668
  668 1002
  EOS
  it { expect(t.exec(<<~EOS)).to eq("NO") }
  100 200
  300 150
  EOS
  it { expect(t.exec(<<~EOS)).to eq("NO") }
  120 120
  240 240
  EOS
end

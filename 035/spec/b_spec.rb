require 'spec_helper'

t = AtCoderTest.new(__FILE__)

describe t.name do
  it {
    expect(t.exec(<<~EOS)).to eq("3")
    UL?
    1
    EOS
  }
  it {
    expect(t.exec(<<~EOS)).to eq("1")
    UD?
    1
    EOS
  }
  it {
    expect(t.exec(<<~EOS)).to eq("7")
    UUUU?DDR?LLLL
    1
    EOS
  }
  it {
    expect(t.exec(<<~EOS)).to eq("3")
    UULL?
    2
    EOS
  }
end

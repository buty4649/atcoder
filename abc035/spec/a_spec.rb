require 'spec_helper'

t = AtCoderTest.new(__FILE__)

describe t.name do
  it { expect(t.exec("4 3")).to eq("4:3") }
  it { expect(t.exec("16 9")).to eq("16:9") }
  it { expect(t.exec("28 21")).to eq("4:3") }
end

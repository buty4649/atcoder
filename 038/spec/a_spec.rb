require 'spec_helper'

t = AtCoderTest.new(__FILE__)

describe t.name do
  it { expect(t.exec("ICEDT")).to eq("YES") }
  it { expect(t.exec("MUGICHA")).to eq("NO") }
  it { expect(t.exec("OOLONGT")).to eq("YES") }
  it { expect(t.exec("T")).to eq("YES") }
  it { expect(t.exec("TEA")).to eq("NO") }
end

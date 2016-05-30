require 'spec_helper'

t = AtCoderTest.new(__FILE__)

describe t.name do
  it { expect(t.exec("100")).to eq("99") }
  it { expect(t.exec("123456789")).to eq("123456790") }
end

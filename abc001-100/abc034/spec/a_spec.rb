require 'spec_helper'

t = AtCoderTest.new(__FILE__)

describe t.name do
  it { expect(t.exec("12 34")).to eq("Better") }
  it { expect(t.exec("98 56")).to eq("Worse") }
end

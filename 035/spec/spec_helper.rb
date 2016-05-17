require 'rspec'
require 'open3'

Dir["./support/**/*.rb"].each do |f|
  require f
end

RSpec.configure do |config|
end

class AtCoderTest
  attr_reader :name
  def initialize(fullpath)
    cwd = File.dirname(fullpath)
    myname = File.basename(fullpath)
    @target = File.absolute_path("../#{myname.sub(/_spec/, "")}", cwd)
    @name = "#{File.basename(File.dirname(cwd))}/#{myname.slice(0).upcase}"
  end

  def exec(input)
    o, _, _ = Open3.capture3("#{@target}", :stdin_data => input)
    o.chomp
  end
end

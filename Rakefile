require "readline"

Dir.chdir(Rake.application.original_dir)

desc "Run the tests"
task :test do
  Dir.glob('tests/*.in').each do |file|
    result = `ruby main.rb < #{file}`
    correct = File.read(file.sub(/\.in$/, '.out'))
    if result == correct
      puts "✅ #{file}"
    else
      puts "🆖 #{file}"
      puts "-- got >> -------"
      puts result
      puts "-- expect << ----"
      puts correct
      puts "-----------------"
    end
  end
end

desc "Submit"
task :submit do
  sh "acc submit main.rb"
end

desc "New"
task :new do
  contest_id = Readline.readline("Contest ID(abcXXX): ")
  sh "acc new #{contest_id}"
end

desc "Add"
task :add do
  sh "acc add"
end

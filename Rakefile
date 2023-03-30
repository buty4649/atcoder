require "readline"
require "json"

def sample_files
  Dir.glob('tests/*.in').sort
end

def contest_dirs
  Dir.glob('*/main.rb').sort.map { |f| File.dirname(f) }
end

def last_task
  JSON.parse(File.read("contest.acc.json"))
      .fetch("tasks")
      .select {|t| t["directory"] }
      .last
end

Dir.chdir(Rake.application.original_dir)

desc "New"
task :new do
  contest_id = Readline.readline("Contest ID(abcXXX): ")
  sh "acc new #{contest_id}"
end

desc "Add"
task :add do
  sh "acc add --choice next"
  Rake::Task["open"].invoke
end

desc "Open current task page"
task :open do
  url = last_task["url"]
  sh "open #{url}"
end

desc "Submit"
task :submit do
  if sample_files.empty?
    path = last_task.dig("directory", "path")
    Dir.chdir(path) do
      sh "rake -s submit", verbose: false
    end
  else
    sh "acc submit main.rb"
  end
end

desc "Run samples"
task :run do
  if sample_files.empty?
    path = last_task.dig("directory", "path")
    Dir.chdir(path) do
      sh "rake -s run", verbose: false
    end
  else
    Rake::Task.tasks.select { |t| t.name =~ /^run:/ }.each do |task|
      puts "-- #{task.name} --"
      task.invoke
    end
  end
end

desc "Run the tests"
task :test do
  if sample_files.empty?
    path = last_task.dig("directory", "path")
    Dir.chdir(path) do
      sh "rake -s test", verbose: false
    end
  else
    sample_files.each do |file|
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
end

namespace :submit do
  contest_dirs.each do |dir|
    desc "Submit #{dir}"
    task dir do
      Dir.chdir(dir) do
        sh "rake -s submit", verbose: false
      end
    end

    # / 付きも許容しておく
    task "#{dir}/" do
      Rake::Task["submit:#{dir}"].invoke
    end
  end
end

namespace :run do
  sample_files.each do |file|
    name = File.basename(file, '.in')
    desc "Run #{name}"
    task name do
      sh "ruby main.rb < #{file}", verbose: false
    end
  end

  contest_dirs.each do |dir|
    desc "Run samples in #{dir}"
    task dir do
      Dir.chdir(dir) do
        sh "rake -s run", verbose: false
      end
    end

    # / 付きも許容しておく
    task "#{dir}/" do
      Rake::Task["run:#{dir}"].invoke
    end
  end
end

namespace :test do
  contest_dirs.each do |dir|
    desc "Run tests in #{dir}"
    task dir do
      Dir.chdir(dir) do
        sh "rake -s test", verbose: false
      end
    end

    # / 付きも許容しておく
    task "#{dir}/" do
      Rake::Task["test:#{dir}"].invoke
    end
  end
end

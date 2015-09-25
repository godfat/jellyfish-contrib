
begin
  require "#{dir = File.dirname(__FILE__)}/task/gemgem"
rescue LoadError
  sh 'git submodule update --init'
  exec Gem.ruby, '-S', $PROGRAM_NAME, *ARGV
end

Gemgem.init(dir) do |s|
  s.name    = 'jellyfish-contrib'
  s.version = '1.0.0'
  %w[jellyfish].each{ |g| s.add_runtime_dependency(g) }
end

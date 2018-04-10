# -*- encoding: utf-8 -*-
# stub: jellyfish-contrib 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jellyfish-contrib".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lin Jen-Shin (godfat)".freeze]
  s.date = "2018-04-11"
  s.description = "Extra [Jellyfish](https://github.com/godfat/jellyfish) extensions.".freeze
  s.email = ["godfat (XD) godfat.org".freeze]
  s.files = [
  ".gitignore".freeze,
  ".gitmodules".freeze,
  ".travis.yml".freeze,
  "CHANGES.md".freeze,
  "Gemfile".freeze,
  "LICENSE".freeze,
  "README.md".freeze,
  "Rakefile".freeze,
  "config.ru".freeze,
  "jellyfish-contrib.gemspec".freeze,
  "lib/jellyfish-contrib.rb".freeze,
  "lib/jellyfish/multi_actions.rb".freeze,
  "lib/jellyfish/newrelic.rb".freeze,
  "lib/jellyfish/sinatra.rb".freeze,
  "lib/jellyfish/swagger.rb".freeze,
  "public/css/screen.css".freeze,
  "public/index.html".freeze,
  "public/js/shred.bundle.js".freeze,
  "public/js/shred/content.js".freeze,
  "public/js/swagger-ui.js".freeze,
  "public/js/swagger.js".freeze,
  "task/README.md".freeze,
  "task/gemgem.rb".freeze,
  "test/test_from_readme.rb".freeze,
  "test/test_multi_actions.rb".freeze,
  "test/test_swagger.rb".freeze]
  s.homepage = "https://github.com/godfat/jellyfish-contrib".freeze
  s.licenses = ["Apache License 2.0".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Extra [Jellyfish](https://github.com/godfat/jellyfish) extensions.".freeze
  s.test_files = [
  "test/test_from_readme.rb".freeze,
  "test/test_multi_actions.rb".freeze,
  "test/test_swagger.rb".freeze]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jellyfish>.freeze, [">= 0"])
    else
      s.add_dependency(%q<jellyfish>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<jellyfish>.freeze, [">= 0"])
  end
end

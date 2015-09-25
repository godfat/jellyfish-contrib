# -*- encoding: utf-8 -*-
# stub: jellyfish-contrib 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jellyfish-contrib"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Lin Jen-Shin (godfat)"]
  s.date = "2015-09-25"
  s.description = "Extra [Jellyfish](https://github.com/godfat/jellyfish) extensions."
  s.email = ["godfat (XD) godfat.org"]
  s.files = [
  ".gitignore",
  ".gitmodules",
  ".travis.yml",
  "CHANGES.md",
  "Gemfile",
  "LICENSE",
  "README.md",
  "Rakefile",
  "config.ru",
  "jellyfish-contrib.gemspec",
  "lib/jellyfish-contrib.rb",
  "lib/jellyfish/multi_actions.rb",
  "lib/jellyfish/sinatra.rb",
  "lib/jellyfish/swagger.rb",
  "public/css/screen.css",
  "public/index.html",
  "public/js/shred.bundle.js",
  "public/js/shred/content.js",
  "public/js/swagger-ui.js",
  "public/js/swagger.js",
  "task/README.md",
  "task/gemgem.rb",
  "test/test_from_readme.rb",
  "test/test_multi_actions.rb",
  "test/test_swagger.rb"]
  s.homepage = "https://github.com/godfat/jellyfish-contrib"
  s.licenses = ["Apache License 2.0"]
  s.rubygems_version = "2.4.8"
  s.summary = "Extra [Jellyfish](https://github.com/godfat/jellyfish) extensions."
  s.test_files = [
  "test/test_from_readme.rb",
  "test/test_multi_actions.rb",
  "test/test_swagger.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jellyfish>, [">= 0"])
    else
      s.add_dependency(%q<jellyfish>, [">= 0"])
    end
  else
    s.add_dependency(%q<jellyfish>, [">= 0"])
  end
end

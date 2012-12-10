# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'color_name-i18n'

Gem::Specification.new do |s|
  s.name = %q{color_name-i18n}
  s.version = ColorNameI18n::VERSION
  s.homepage = "http://freeridepg.org/"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{William Wedler}]
  s.date = %q{2012-11-09}
  s.description = %q{Localized color names}
  s.email = %q{wedler.w@freeridepgh.org}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = `git ls-files`.split("\n")
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Localized color names intended to be used as a single source for listing colors in an internationalized application.}

  s.add_development_dependency(%q<rake>, [">= 0"])
  s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
  s.add_development_dependency(%q<bundler>, ["~> 1.2"])
  s.add_development_dependency(%q<i18n-spec>, [">= 0"])
  s.add_development_dependency(%q<i18n>, [">= 0"])

  s.add_dependency(%q<bundler>, ["~> 1.2"])
  s.add_dependency(%q<i18n>, [">= 0"])

end


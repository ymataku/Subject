# -*- encoding: utf-8 -*-
# stub: greenmat 3.5.1.2 ruby lib
# stub: ext/greenmat/extconf.rb

Gem::Specification.new do |s|
  s.name = "greenmat".freeze
  s.version = "3.5.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Natacha Port\u00E9".freeze, "Vicent Mart\u00ED".freeze]
  s.date = "2021-07-01"
  s.description = "A Markdown parser for Qiita, based on Redcarpet.".freeze
  s.email = "nkymyj@gmail.com".freeze
  s.executables = ["greenmat".freeze]
  s.extensions = ["ext/greenmat/extconf.rb".freeze]
  s.extra_rdoc_files = ["COPYING".freeze]
  s.files = ["COPYING".freeze, "bin/greenmat".freeze, "ext/greenmat/extconf.rb".freeze]
  s.homepage = "https://github.com/increments/greenmat".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.1.6".freeze
  s.summary = "A Markdown parser for Qiita, based on Redcarpet.".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_development_dependency(%q<nokogiri>.freeze, ["~> 1.6.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.2.1"])
    s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 1.0.3"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.2"])
    s.add_development_dependency(%q<test-unit>.freeze, ["~> 3.2.3"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.2.1"])
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.0.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
    s.add_dependency(%q<test-unit>.freeze, ["~> 3.2.3"])
  end
end

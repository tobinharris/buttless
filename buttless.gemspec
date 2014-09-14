# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: buttless 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "buttless"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Tobin Harris"]
  s.date = "2014-09-14"
  s.description = "Buttless gives you a way to quickly flesh out an API in detail. It generates sexy documentation. And, you can quickly run the API and simulate various scenarios without neededing a backend."
  s.email = "tobin@tobinharris.com"
  s.executables = ["buttless"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README_old.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README_old.rdoc",
    "Rakefile",
    "VERSION",
    "bin/buttless",
    "buttless.gemspec",
    "lib/buttless.rb",
    "lib/template/.DS_Store",
    "lib/template/Gemfile",
    "lib/template/Gemfile.lock",
    "lib/template/Rakefile",
    "lib/template/api-doc/.DS_Store",
    "lib/template/api-doc/images/logo.png",
    "lib/template/api-doc/index.html",
    "lib/template/api-doc/index.md.erb",
    "lib/template/api-doc/report.css",
    "lib/template/api-doc/screen.css",
    "lib/template/api-doc/template.html.erb",
    "lib/template/code_samples/prthw.md.erb",
    "lib/template/config.ru",
    "lib/template/config.yaml",
    "lib/template/database.yaml",
    "lib/template/install",
    "lib/template/json_examples/funky_stuff.json",
    "lib/template/json_examples/funky_stuff_info.json",
    "lib/template/json_examples/funky_thing.json",
    "lib/template/json_examples/post_ok.json",
    "lib/template/readme.textile",
    "lib/template/test/test_helper.rb",
    "lib/template/test/test_stuff.rb",
    "readme.textile",
    "test/helper.rb",
    "test/test_buttless.rb"
  ]
  s.homepage = "http://github.com/tobinharris/buttless"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Design, document and develop against an API without having a backend."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<pdfkit>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<minitest>, [">= 0"])
      s.add_runtime_dependency(%q<googlecharts>, [">= 0"])
      s.add_runtime_dependency(%q<array_stats>, [">= 0"])
      s.add_runtime_dependency(%q<redcarpet>, [">= 0"])
      s.add_runtime_dependency(%q<webmock>, [">= 0"])
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<tilt>, [">= 0"])
      s.add_runtime_dependency(%q<minitest-reporters>, [">= 0"])
      s.add_runtime_dependency(%q<sinatra>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<rest-client>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<pdfkit>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<googlecharts>, [">= 0"])
      s.add_dependency(%q<array_stats>, [">= 0"])
      s.add_dependency(%q<redcarpet>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<tilt>, [">= 0"])
      s.add_dependency(%q<minitest-reporters>, [">= 0"])
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rest-client>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<pdfkit>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<googlecharts>, [">= 0"])
    s.add_dependency(%q<array_stats>, [">= 0"])
    s.add_dependency(%q<redcarpet>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<tilt>, [">= 0"])
    s.add_dependency(%q<minitest-reporters>, [">= 0"])
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end


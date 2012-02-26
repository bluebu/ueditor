# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ueditor/version"

Gem::Specification.new do |s|
  s.name        = "ueditor"
  s.version     = Ueditor::VERSION
  s.authors     = ["bluebu"]
  s.email       = ["bluebuwang@gmail.com"]
  s.homepage    = "http://www.hi-ruby.com"
  s.summary     = %q{easy integration ueditor in your rails application}
  s.description = %q{ueditor is a WYSIWYG editor to be used inside web pages}

  s.rubyforge_project = "ueditor"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

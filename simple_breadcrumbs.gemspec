# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simple_breadcrumbs/version"

Gem::Specification.new do |s|
  s.name        = "simple_breadcrumbs"
  s.version     = SimpleBreadcrumbs::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ronaldo Gomes (Linkrjr)"]
  s.email       = ["ronaldo@technophile.it"]
  s.homepage    = "https://github.com/linkrjr/breadcrumbs"
  s.summary     = %q{Simple Breadcrumbs renderer}
  s.description = %q{Simple Breadcrumbs is the easest way to implement a breadcrumb for your website}

  s.rubyforge_project = "simple_breadcrumbs"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "rails"
  
end

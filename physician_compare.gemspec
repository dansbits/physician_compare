# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'physician_compare/version'

Gem::Specification.new do |spec|
  spec.name          = "physician_compare"
  spec.version       = PhysicianCompare::VERSION
  spec.authors       = ["Dan Carpenter"]
  spec.email         = ["daniel.carpenter01@gmail.com"]
  spec.summary       = %q{Provides a parser for the CMS Physican Compare dataset}
  spec.description   = %q{Provides a parser for the CMS Physican Compare dataset}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

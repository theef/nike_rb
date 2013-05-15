# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nike_rb/version'

Gem::Specification.new do |spec|
  spec.name          = "nike_rb"
  spec.version       = NikeRb::VERSION
  spec.authors       = ["Kevin Wanek"]
  spec.email         = ["k@dmcy.us"]
  spec.summary       = %q{NikeRb is a ruby wrapper for the Nike Developers API.  Originally created for use with the Nike Fuelband API.  Support for other devices may be added at a later date.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "httparty"
  spec.add_dependency "json"
end

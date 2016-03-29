# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_attr_extended/version'

Gem::Specification.new do |spec|
  spec.name          = "active_attr_extended"
  spec.version       = ActiveAttrExtended::VERSION
  spec.authors       = ["Jason Haruska"]
  spec.email         = ["jason@haruska.com"]

  spec.summary       = "What ActiveModel left out (including Collections)"
  spec.description   = "An extension of the active_attr gem, adding Arrays and Hashes as valid attribute types. Create plain old ruby models without reinventing the wheel."
  spec.homepage      = "https://github.com/haruska/active_attr_extended"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "active_attr", ">= 0.6.0"

  spec.add_development_dependency "appraisal", "~> 2.1.0"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

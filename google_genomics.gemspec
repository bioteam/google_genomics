# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_genomics/version'

Gem::Specification.new do |spec|
  spec.name          = "google_genomics"
  spec.version       = GoogleGenomics::VERSION
  spec.authors       = ["William Van Etten"]
  spec.email         = ["vanetten@bioteam.net"]
  spec.summary       = "GoogleGenomics API client for rails"
  spec.description   = "This library is build on top of google-api-client"
  spec.homepage      = "https://github.com/bioteam/google_genomics"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails", "~> 4.0.0"

  spec.add_runtime_dependency("google-api-client")

  spec.add_dependency "hashie"
  spec.add_dependency "activesupport"
  spec.add_dependency "activerecord"

end

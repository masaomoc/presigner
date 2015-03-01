# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'presigner/version'

Gem::Specification.new do |spec|
  spec.name          = "presigner"
  spec.version       = Presigner::VERSION
  spec.authors       = ["Masao Mochizuki"]
  spec.email         = ["mochizukimasao.030@gmail.com"]
  spec.summary       = %q{CLI Tool to generate Pre-Signed URL for Amazon S3}
  spec.description   = %q{Presigner is a CLI tool to simple generate Pre-Signed URL for Amazon S3}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.0"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-shell"

  spec.add_dependency "thor"
  spec.add_dependency "aws-sdk-v1"
  spec.add_dependency "pry"
end

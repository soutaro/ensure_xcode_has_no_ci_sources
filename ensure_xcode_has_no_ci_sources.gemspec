# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ensure_xcode_has_no_ci_sources/version'

Gem::Specification.new do |spec|
  spec.name          = "ensure_xcode_has_no_ci_sources"
  spec.version       = EnsureXcodeHasNoCiSources::VERSION
  spec.authors       = ["Soutaro Matsumoto"]
  spec.email         = ["matsumoto@soutaro.com"]

  spec.summary       = %q{Find out case insensitive sources in your Xcode project.}
  spec.description   = %q{Find out source files which has differently cased names between Xcode project and file system.}
  spec.homepage      = "https://github.com/soutaro/ensure_xcode_has_no_ci_sources"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'xcodeproj', "~> 1.0"
  spec.add_dependency 'rainbow', "~> 2.1"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'u_presenter/version'

Gem::Specification.new do |spec|
  spec.name          = "u_presenter"
  spec.version       = UPresenter::VERSION
  spec.authors       = ["Nick Savrov"]
  spec.email         = ["savroff@gmail.com"]

  spec.summary       = %q{Add simple presenter Layer to your Rails App}
  spec.description   = %q{Simple Presenter for Rails App}
  spec.homepage      = "https://github.com/savroff/u_presenter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4.0"
  spec.add_development_dependency "pry", "~> 0.10.0"
end

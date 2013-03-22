# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'divine/version'

Gem::Specification.new do |gem|
  gem.name          = "divine"
  gem.version       = Divine::VERSION
  gem.authors       = ["Kyle Decot"]
  gem.email         = ["kyle.decot@icloud.com"]
  gem.description   = %q{Rubygem for interacting w/ Vine's API}
  gem.summary       = %q{Rubygem for interacting w/ Vine's API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "httparty"
end

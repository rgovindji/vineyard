# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vineyard/version'

Gem::Specification.new do |gem|
  gem.name          = "vineyard"
  gem.version       = Vineyard::VERSION
  gem.authors       = ["Kyle Decot"]
  gem.email         = ["kyle.decot@icloud.com"]
  gem.description   = %q{A Ruby interface to Vine's unofficial API}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/kyledecot/vineyard"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "faraday"
end

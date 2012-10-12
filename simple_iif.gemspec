# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simple_iif/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dave Thomas"]
  gem.email         = ["dave@pragprog.com"]
  gem.description   = %q{A simple library to assist in the handling of Quickbooks IIF files}
  gem.summary       = gem.description
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "simple_iif"
  gem.require_paths = ["lib"]
  gem.version       = SimpleIif::VERSION
end

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string-width/tanasinn/version'

Gem::Specification.new do |gem|
  gem.name          = "string-width-tanasinn"
  gem.version       = String::Width::Tanasinn::VERSION
  gem.authors       = ["USAMI Kenta"]
  gem.email         = ["tadsan@zonu.me"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

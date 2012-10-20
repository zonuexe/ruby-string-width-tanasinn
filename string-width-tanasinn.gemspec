# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string-width/tanasinn/version'

Gem::Specification.new do |gem|
  gem.name          = "string-width-tanasinn"
  gem.version       = StringWidth::Tanasinn::VERSION
  gem.authors       = ["USAMI Kenta"]
  gem.email         = ["tadsan@zonu.me"]
  gem.description   = %q{this gem provide module function that imported the algorithm to measure the width of the Charactor from  `tanasinn' terminal emulator. The function is divided into the thing except thing and it for CJK environment.}
  gem.summary       = "imported the algorithm to measure the width of the Charactor from  `tanasinn' terminal emulator."
  gem.homepage      = "https://github.com/zonuexe/string-width-tanasinn"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

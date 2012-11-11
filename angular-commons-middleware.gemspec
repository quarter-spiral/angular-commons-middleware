# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'angular-commons-middleware/version'

Gem::Specification.new do |gem|
  gem.name          = "angular-commons-middleware"
  gem.version       = Angular::Commons::Middleware::VERSION
  gem.authors       = ["Thorben Schröder"]
  gem.email         = ["stillepost@gmail.com"]
  gem.description   = %q{Collection of Angular modules used accross Quarter Spiral applications}
  gem.summary       = %q{Collection of Angular modules used accross Quarter Spiral applications}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'brochure'
  gem.add_dependency 'therubyracer'
  gem.add_dependency 'coffee-script'
  gem.add_dependency 'json'
end

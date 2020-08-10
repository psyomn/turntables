# frozen_string_literal: true

require File.expand_path('lib/turntables/version', __dir__)

Gem::Specification.new do |gem|
  gem.name          = 'turntables'
  gem.version       = Turntables::VERSION
  gem.summary       = 'A dumb db migration system for SQLite3'
  gem.description   = 'A dumb db migration system for SQLite3'
  gem.license       = 'MIT'
  gem.authors       = ['psyomn']
  gem.email         = 'lethaljellybean@gmail.com'
  gem.homepage      = 'https://rubygems.org/gems/turntables'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 2.1'
  gem.add_development_dependency 'rake', '>= 13.0'
  gem.add_development_dependency 'rspec', '~> 3.9'
  gem.add_development_dependency 'rubocop', '~> 0.80'

  gem.add_runtime_dependency 'sqlite3', '~> 1.4.2'

  gem.required_ruby_version = '>= 2.4'
end

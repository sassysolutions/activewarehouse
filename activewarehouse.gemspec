# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'active_warehouse/version'

Gem::Specification.new do |s|
  s.name = %q{activewarehouse}
  s.version = ActiveWarehouse::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Anthony Eden", "Thibaut Barrère", "Scott Ellard"]
  s.email = ["thibaut.barrere@gmail.com", "scott.ellard@gmail.com"]
  s.homepage = "https://github.com/activewarehouse/activewarehouse"
  s.summary = %q{ActiveWarehouse extends Rails to provide functionality specific for building data warehouses.}
  s.description = %q{ActiveWarehouse extends Rails to provide functionality specific for building data warehouses.}
  s.rubyforge_project = %q{activewarehouse}

  s.required_rubygems_version = ">= 1.3.6"

  s.add_runtime_dependency('rake',                '>= 10.0.0')
  s.add_runtime_dependency('rails',               '>= 4.0.0')
  s.add_runtime_dependency('activesupport',       '>= 4.0.0')
  s.add_runtime_dependency('activerecord',        '>= 4.0.0')
  s.add_runtime_dependency('actionpack',          '>= 4.0.0')
  s.add_runtime_dependency('fastercsv',           '>= 1.1.0')
  s.add_runtime_dependency('rails_sql_views',     '>= 0.1.0')

  s.add_development_dependency('guard')
  s.add_development_dependency('guard-test')
  s.add_development_dependency('guard-rspec')
  s.add_development_dependency('sqlite3')
  s.add_development_dependency('rspec', '>=3.0.0')
  s.add_development_dependency('factory_girl_rails', '>=3.3.0')
  s.add_development_dependency('database_cleaner', '>=0.8.0')

  s.files              = `git ls-files`.split("\n")
  s.test_files         = `git ls-files -- {test}/*`.split("\n")
  s.require_path       = "lib"
end

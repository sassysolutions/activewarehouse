def declare_gems(rails_version)
  source :rubygems

  gem 'adapter_extensions', :git => 'git://github.com/activewarehouse/adapter_extensions.git'
  gem 'activewarehouse-etl', :git => 'git://github.com/activewarehouse/activewarehouse-etl.git'

  gem 'rails', rails_version

  gem 'mysql2'
  gem 'pg'
  gem 'rspec'
  gem 'factory_girl_rails'
  
  gem 'awesome_print'
  gem 'rake'
  gem 'flexdouble'
  gem 'shoulda', '~> 3.5.0'
  gem 'sqlite3'
  gem 'rspec'
  gem 'database_cleaner'
  
  gem 'spreadsheet'
  gem 'nokogiri'
  gem 'fastercsv'

  gem 'standalone_migrations'
end

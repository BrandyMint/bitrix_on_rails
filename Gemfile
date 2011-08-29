source "http://rubygems.org"
# Add dependencies required to use your gem here.
# Example:
#   gem "activesupport", ">= 2.3.5"

gem 'rails', ">= 3.0"
gem 'php_serialize', :git => 'git://github.com/dapi/php_serialize.git'

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.
group :development, :test do
  gem "sqlite3"
  gem "shoulda", ">= 0"
  gem "bundler", "~> 1.0.0"
  gem "jeweler", "~> 1.6.4"
  gem "rcov", ">= 0"
  gem "ruby-debug19", :require=>'ruby-debug'

  gem 'factory_girl'

  gem 'test-unit'

  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'growl'  if RUBY_PLATFORM =~ /darwin/i
  gem "guard-test"
  # http://test-unit.rubyforge.org/
  # gem 'test-unit-notify'
  gem 'rr'
end

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

RSpec.configure do |config|
    config.pattern = "**/*_spec.rb"
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'helpers'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

RSpec::Matchers.define :be_an_enumerable_of do |cls|
  match do |target|
    target.is_a?(Enumerable) and cls === target.first
  end
  description { "should be an Enumerable of #{cls}"}
end

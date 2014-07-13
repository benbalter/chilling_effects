require 'rubygems'
require 'bundler'
require 'minitest/autorun'
require 'vcr'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'chilling_effects'

ChillingEffects.server = "http://localhost:4000"
ChillingEffects.token = "XgwZLjL94Edo17vxPhwE"

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  c.hook_into :faraday
end

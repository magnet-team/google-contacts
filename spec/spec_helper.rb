$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'google-contacts'
require 'pry'

Dir['./spec/support/*.rb'].each { |file| require file }

RSpec.configure do |c|
  c.mock_with :rspec
end

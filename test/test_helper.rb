require 'simplecov'
SimpleCov.start do
  add_filter 'test/' # Tests should not be checked for coverage.
end

require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/card'
require_relative '../lib/deck'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

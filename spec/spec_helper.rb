require 'bundler'
ENV['BUNDLE_GEMFILE'] = File.expand_path('../../Gemfile', __FILE__)
Bundler.setup

require 'minitest/spec'

require 'helpers/let'
require 'helpers/truncate'
require 'rr'

require 'tarantool/synchrony'

config = { host: '127.0.0.1', port: 33013, space_no: 0 }

Tarantool.configure config

class MiniTest::Unit::TestCase
  extend Helpers::Let
  include RR::Adapters::MiniTest
end

at_exit {
  EM.synchrony do
    exit_code = MiniTest::Unit.new.run(ARGV)
    EM.stop
    exit_code
  end
}
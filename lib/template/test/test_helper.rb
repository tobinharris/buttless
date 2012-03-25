require 'minitest/autorun'
require 'webmock/minitest'
require 'minitest/pride'
require 'minitest/reporters'
require 'rest-client'
require 'json'


module MiniTest
  module Reporters
    class SpecReporter
      private
      def print_test_with_time(test)
        total_time = Time.now - runner.test_start_time
        print(" %s (%.2fs)" % [test.gsub(/test_|[0-9]{4,4}|_/,' ').strip, total_time])
      end
    end
  end
end


MiniTest::Unit.runner = MiniTest::SuiteRunner.new
MiniTest::Unit.runner.reporters << MiniTest::Reporters::SpecReporter.new 

def prepare
  @examples_dir = File.dirname(__FILE__) + "/../json_examples/"
  @localhost = "http://192.168.1.3/api"
end

def json(data)
  JSON.parse(data)
end


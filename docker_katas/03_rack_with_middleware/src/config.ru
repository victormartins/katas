# frozen_string_literal: true

require 'rack'
require './lib/main'
require './lib/middleware/request_tracer'

# Make sure we can see the ruby logs in docker
$stdout.sync = true

# use Rack::CommonLogger, MyApp.logger
use MyApp::RequestTracer, logger: MyApp.logger
run MyApp::Main.new

# frozen_string_literal: true

require 'rack'
require './lib/main'
require './lib/middleware/request_tracer'
require './lib/middleware/request_timer'
require './lib/middleware/request_caching'

# Make sure we can see the ruby logs in docker
$stdout.sync = true

# use Rack::CommonLogger, MyApp.logger
use MyApp::Middleware::RequestTracer, logger: MyApp.logger
use MyApp::Middleware::RequestTimer, logger: MyApp.logger
use MyApp::Middleware::RequestCaching, logger: MyApp.logger
run MyApp::Main.new

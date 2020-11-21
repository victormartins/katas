# frozen_string_literal: true

require 'rack'
require 'logger'

# Main Application Module
module MyApp
  def self.logger
    @logger ||= Logger.new(STDOUT, level: :debug)
  end

  # Main Class
  class Main
    def initialize(logger: MyApp.logger)
      @logger = logger
    end

    def call(env)
      # Controller.action(:index)
      logger.debug { "[#{self.class}] - Executing Main Web Application." }
      [
        200,                               # response status code
        { 'Content-Type' => 'text/html' }, # response headers
        [generate_body(env)]               # response body
      ]
    end

    private

    attr_reader :logger

    def generate_body(env)
      response = Rack::Request.new(env)
      internal_request_id_header = MyApp::Middleware::RequestTracer::INTERNAL_REQUEST_ID
      request_id = response.get_header(internal_request_id_header)

      '<html>' \
        '<h1>Request Tracing:</h1>' \
        "<p>#{internal_request_id_header} = #{request_id}</p>" \
      '</html>'
    end
  end
end

# frozen_string_litera: true

require 'rack'

# Main Application Module
module MyApp
  def self.logger
    @logger ||= Logger.new(STDOUT, level: :debug)
  end

  # Main Class
  class Main
    def call(env)
      [
        200,                              # response status code
        { 'Content-Type' => 'text/html' },# response headers
        [generate_body(env)]              # response body
      ]
    end

    private

    def generate_body(env)
      '<html>' \
        '<h1>Request Tracing:</h1>' \
      '</html>'
    end
  end
end

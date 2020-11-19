require 'rack'
# require 'rack/handler/puma'
require 'thin'
require 'logger'



# handler = Rack::Handler::Thin

class RackWebApp
  def initialize
    @logger = Logger.new(STDOUT, level: :debug)
    @logger.debug { 'RackWebApp initialized' }
  end

  def call(env)
    request = Rack::Request.new(env)
    logger.debug { "Received Request: #{request.ip}" }

    [
      200,
      {
        "Content-Type" => "text/plain",
        "My-Custom-Header" => "Love, and do what you will."
      },
      [":) Hello from Rack :)"]
    ]
  end

  private

  attr_reader :logger
end

# handler.run RackWebApp.new

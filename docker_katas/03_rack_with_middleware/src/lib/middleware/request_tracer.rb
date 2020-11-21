module MyApp
  class RequestTracer
    require 'logger'

    # Initialize in config.ru like so:
    # use MyApp::RequestTracer, logger: MyApp.logger
    def initialize(app, logger:)
      @app = app
      @logger = logger
    end

    def call(env)
      status, headers, body = @app.call(env)

      logger.debug { "[#{self.class}] - Setting Request Tracing..." }

      [status, headers, body]
    end

    private

    attr_reader :logger

  end
end

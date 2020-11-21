# frozen_string_literal: true

module MyApp
  module Middleware
    class RequestTimer
      # Initialize in config.ru like so:
      # use MyApp::RequestTimer, logger: MyApp.logger
      def initialize(app, logger:)
        @app = app
        @logger = logger
      end

      def call(env)
        logger.debug { "[#{self.class}]   - Before calling the app." }
        status, headers, body = @app.call(env)
        logger.debug { "[#{self.class}]   - After calling the app." }

        [status, headers, body]
      end

      private

      attr_reader :logger
    end
  end
end

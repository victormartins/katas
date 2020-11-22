# frozen_string_litera: true

require 'securerandom'

module MyApp
  module Middleware
    # Adds headers to the request to help tracing.
    class RequestTracer
      # Header in is normal format
      RESPONSE_X_REQUEST_ID = 'X-Request-Id'
      # Header in the env format
      REQUEST_HTTP_X_REQUEST_ID = 'HTTP_X_REQUEST_ID'
      # Header to be used internally by the web application
      INTERNAL_REQUEST_ID = "request.tracer.request_id"

      # Initialize in config.ru like so:
      # use MyApp::RequestTracer, logger: MyApp.logger
      def initialize(app, logger:)
        @app = app
        @logger = logger
      end

      def call(env)
        logger.debug { "[#{self.class}] - Before calling the app." }

        logger.debug do
          "[#{self.class}] - env is just an hash that the webserver produced:" \
            "env.class #{env.class} "\
            "env.keys [#{env.keys.first(4).join(', ')}...] so we can add our request id to it."
        end

        # We add our generated request id into an INTERNAL_REQUEST_ID so that
        # the application can use it if needed.
        # Bellow we also add it to the response headers so that if we redirect
        # the request the receivers can use it. It will also be returned to the
        # caller so that he can make requests idempotent.
        request_id = fetch_or_generate_request_id(env)
        env[INTERNAL_REQUEST_ID] = request_id

        # Now we call the rest of the middleware stack which eventually calls the application.
        # Using .tap we add the request_id to the responde headers.
        status, headers, body = @app.call(env).tap do |_status, headers, _body|
          logger.debug do
            "[#{self.class}] - Setting the request id in the response headers, so that" \
              "it can be accessible by any caller or redirection to other services."
          end
          insert_request_id_to_response(headers, request_id)
        end

        logger.debug { "[#{self.class}] - After calling the app." }

        [status, headers, body]
      end

      private

      attr_reader :logger

      def insert_request_id_to_response(headers, request_id)
        headers[RESPONSE_X_REQUEST_ID] = request_id
      end

      def fetch_or_generate_request_id(env)
        request = Rack::Request.new(env)

        request_id = request.get_header(REQUEST_HTTP_X_REQUEST_ID)

        if(request_id)
          logger.debug { "[#{self.class}] - #{RESPONSE_X_REQUEST_ID} found: [#{request_id}]" }
          request_id
        else
          request_id = SecureRandom.uuid
          logger.debug { "[#{self.class}] - #{RESPONSE_X_REQUEST_ID} not found. Generated: #{request_id} " }
          request_id
        end
      end
    end
  end
end

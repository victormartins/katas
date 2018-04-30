# frozen_string_literal: true

workers Integer(ENV['WEB_WORKERS'] || 4)
# Min and Max threads per worker
threads_count = Integer(ENV.fetch('WEB_THREADS', 2))
threads threads_count, threads_count
environment ENV.fetch('RACK_ENV')

bind 'tcp://0.0.0.0:4567'
